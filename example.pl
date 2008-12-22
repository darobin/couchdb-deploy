
use CouchDB::Deploy;

# need to automatically parse options to know what the server is
# don't use a cache file, just talk to the server and figure out if we need to change things or not
# we probably want to generate interfaces out of this, so it shouldn't have the use CouchDB::Deploy
# but rather be loaded and eval'ed in different contexts producing different results

db 'robin-test-db/', containing {
    doc {
        _id     => 'foo',
        key     => 'value',
        _attachments => {
            'foo.txt'   => {
                content_type    => 'text/plain',
                data            => 'RGFodXRzIEZvciBXb3JsZCBEb21pbmF0aW9uXCE=',
            },
            'bar.svg'   => {
                content_type    => 'image/svg+xml',
                data            => file 'dahut.svg',
            },
        },
    };
    design {
        _id         => '_design/dahuts',
        language    => 'javascript',
        views   => {
            'all'   => {
                map     => "function(doc) { if (doc.type == 'dahut')  emit(null, doc) }",
            },
        },
    };
};


