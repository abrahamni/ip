//
//
// FILES & UPLOADS API
//
//

module.exports = function (APP) {
    'use strict';

    APP.UPLOAD = {};


    APP.UPLOAD.fileFromFormData = function (params, callback) {
        var form = new APP.lib.multiparty.Form({
            autoFields: false,
            autoFiles: true,
            maxFilesSize: APP.CONFIG.FILE_MAX_SIZE,
            uploadDir: APP.CONFIG.UPLOAD_DIR
        });
        form.parse(params.req, function (err, fields, files) {
            if (err) { 
                return APP.serverError('uploadFiles() > form.parse', err, callback); 
            }

            var uploadedFiles = [];
            var sqlQueries = [];

            Object.keys(files).forEach(function (fieldName) {
                files[fieldName].forEach(function (file) {
                    uploadedFiles.push({
                        field_name: file.fieldName,
                        filename: APP.lib.path.basename(file.path),
                        original_filename: file.originalFilename,
                        mime_type: file.headers['content-type'],
                        size: file.size
                    });
                });
            });

            if (uploadedFiles.length === 1) {
                uploadedFiles = uploadedFiles[0];
            }

            callback(null, uploadedFiles);

            // sqlQueries = uploadedFiles.map(function (file) {
            //     return {
            //         table: 'files',
            //         fields: {
            //             filename: file.filename,
            //             original_filename: file.original_filename,
            //             mime_type: file.mime_type,
            //             size: file.size
            //         },
            //         returnValue: 'id'
            //     };
            // });

            // APP.lib.db.beginTransaction(function (transaction) {
            //     transaction.query(sqlQueries, function (err) {
            //         if (err) { 
            //             transaction.rollback(); 
            //             return APP.serverError('uploadFiles()', err, callback); 
            //         }

            //         var insertedIds = Array.prototype.slice.call(arguments, 1);
            //         insertedIds.forEach(function (row, index) {
            //             uploadedFiles[index].id = row.id;
            //         });

            //         if (uploadedFiles.length === 1) {
            //             uploadedFiles = uploadedFiles[0];
            //         }
                    
            //         transaction.commit();
            //         callback(null, uploadedFiles);
            //     });
            // });
        });
    };


};