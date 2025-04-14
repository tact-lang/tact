const os = require("os");
module.exports = {
    preset: "ts-jest",
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    moduleNameMapper: {
        "^@/(.*)$": "<rootDir>/src/$1",
    },
    testEnvironment: "allure-jest/node",
    testEnvironmentOptions: {
        resultsDir: "allure-results",
        links: {
            issue: {
                nameTemplate: "Issue #%s",
                urlTemplate: "https://github.com/tact-lang/tact/issues/%s",
            }
        },
        environmentInfo: {
            os_platform: os.platform(),
            os_release: os.release(),
            os_version: os.version(),
            node_version: process.version,
        },
    },
    testPathIgnorePatterns: ["/node_modules/", "/dist/"],
    globalSetup: "./jest.globalSetup.js",
    setupFiles: ["./jest.setup.js"],
    globalTeardown: "./jest.teardown.js",
    snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
    maxWorkers: "4",
    testTimeout: 10000,
};
