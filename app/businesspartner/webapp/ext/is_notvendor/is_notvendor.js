sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        is_notvendor: function(oBindingContext, aSelectedContexts) {
            aSelectedContexts.forEach(element => {
                var aData = jQuery.ajax({
                    type: "PATCH",
                    contentType: "application/json",
                    url: "/odata/v4/electronicsapp" + element.sPath,
                    data: JSON.stringify({is_vendor: false})
                }).then(element.requestRefresh());
            });
        }
    };
});
