___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "displayName": "Converge Chat Widget",
  "description": "Add the Converge live chat widget to your website. Converge unifies customer conversations from Telegram, WhatsApp, Messenger, Discord, Zalo, Gmail, and web chat into one inbox. For more information, visit https://useconverge.app",
  "categories": ["CHAT", "LEAD_GENERATION", "SALES"],
  "securityGroups": [],
  "id": "cvt_temp_public_id",
  "type": "TAG",
  "version": 1,
  "brand": {
    "thumbnail": "https://raw.githubusercontent.com/justvibesfyi/gtm-converge-chat-widget/master/icon.png",
    "displayName": "Converge",
    "id": "brand_dummy"
  },
  "containerContexts": [
    "WEB"
  ]
}

___TEMPLATE_PARAMETERS___

[
  {
    "help": "Enter your Converge API Key. You can find this in your Converge dashboard under Settings > Widget.",
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "displayName": "API Key",
    "simpleValueType": true,
    "name": "apiKey",
    "type": "TEXT",
    "valueHint": "e.g. 019b0a99-2c16-7000-b275-efca4c7ba653"
  }
]

___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://unpkg.com/@convergeapp/"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "__CONVERGE_CONFIG__"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]

___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const queryPermission = require('queryPermission');

var apiKey = data.apiKey;

if (!apiKey) {
  data.gtmOnFailure();
  return;
}

setInWindow('__CONVERGE_CONFIG__', {
  apiKey: apiKey
}, true);

var scriptUrl = 'https://unpkg.com/@convergeapp/chat-widget/dist/widget.js';

if (queryPermission('inject_script', scriptUrl)) {
  injectScript(scriptUrl, data.gtmOnSuccess, data.gtmOnFailure, 'convergeWidget');
} else {
  data.gtmOnFailure();
}

___TESTS___

scenarios:
  - name: Widget loads successfully with valid API key
    code: |-
      const mockData = {
        apiKey: '019b0a99-2c16-7000-b275-efca4c7ba653'
      };

      mock('queryPermission', function() { return true; });
      mock('injectScript', function(url, onSuccess) { onSuccess(); });

      runCode(mockData);

      assertApi('setInWindow').wasCalledWith('__CONVERGE_CONFIG__', {apiKey: '019b0a99-2c16-7000-b275-efca4c7ba653'}, true);
      assertApi('gtmOnSuccess').wasCalled();

  - name: Widget fails when API key is missing
    code: |-
      const mockData = {
        apiKey: ''
      };

      runCode(mockData);

      assertApi('gtmOnFailure').wasCalled();

  - name: Widget fails when script injection is not permitted
    code: |-
      const mockData = {
        apiKey: '019b0a99-2c16-7000-b275-efca4c7ba653'
      };

      mock('queryPermission', function() { return false; });

      runCode(mockData);

      assertApi('gtmOnFailure').wasCalled();


___NOTES___

Converge Chat Widget - Google Tag Manager Template
https://useconverge.app

This template adds the Converge live chat widget to your website.
Converge unifies customer conversations from multiple platforms into one inbox.
