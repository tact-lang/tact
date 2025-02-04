const mainConfig = require("./jest.config");

module.exports = {
    ...mainConfig,
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    testPathIgnorePatterns: [
        "/node_modules/",
        "/dist/",
        "/src/test/e2e-emulated/map*",
        "/src/cli/e2e.spec.ts",
        "/src/ast/fuzz.spec.ts",
        "/src/test/benchmarks/jetton/jetton.spec.ts",
    ],
    maxWorkers: "8",
};
