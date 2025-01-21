module.exports = {
    preset: "ts-jest",
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    testEnvironment: "node",
    testPathIgnorePatterns: ["/node_modules/", "/dist/"],
    maxWorkers: "8",
    globalSetup: "./jest.setup.js",
    globalTeardown: "./jest.teardown.js",
    snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
};
