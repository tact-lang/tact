const mainConfig = require("./jest.config");

module.exports = {
    ...mainConfig,
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    testPathIgnorePatterns: [
        "/node_modules/",
        "/dist/",
        "/src/test/e2e-slow/",
        "/src/cli/e2e.spec.ts",
        "/src/ast/fuzz.spec.ts",
    ],
    maxWorkers: "1",
};
