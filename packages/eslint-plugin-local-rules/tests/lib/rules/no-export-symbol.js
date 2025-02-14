"use strict";

const rule = require("../../../lib/rules/no-export-symbol");
const { ruleTester } = require("../utils");

ruleTester.run("no-export-symbol", rule, {
    valid: [
        {
            code: `const exampleSymbol = Symbol("example");`,
        },
    ],

    invalid: [
        {
            code: `
const exampleSymbol = Symbol("example");
export { exampleSymbol };
      `,
            errors: [
                {
                    messageId: "forbiddenExportSymbol",
                    data: { name: "exampleSymbol" },
                },
            ],
        },
    ],
});
