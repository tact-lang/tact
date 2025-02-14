const Mocha = require("mocha");
const { RuleTester } = require("@typescript-eslint/rule-tester");

RuleTester.afterAll = Mocha.after;

module.exports.ruleTester = new RuleTester({
    languageOptions: {
        parserOptions: {
            projectService: {
                allowDefaultProject: ["*.ts"],
            },
        },
    },
});
