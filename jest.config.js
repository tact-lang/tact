module.exports = {
    preset: "ts-jest",
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    testEnvironment: "node",
    testPathIgnorePatterns: ["/node_modules/", "/dist/"],
    globalSetup: "./jest.globalSetup.js",
    setupFiles: ["./jest.setup.js"],
    globalTeardown: "./jest.teardown.js",
    snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
    maxWorkers: "4",
    testTimeout: 10000,
};
