const mainConfig = require("./jest.config");

module.exports = {
    ...mainConfig,

    collectCoverage: true,
    coverageDirectory: "coverage",
    coverageReporters: ["text", "lcov", "html"],
    coveragePathIgnorePatterns: [
        "/node_modules/",
        "/dist/",
        "/output/",
        "/func/",
    ],
};
