export default {
    preset: "ts-jest",
    testEnvironment: "node",
    testPathIgnorePatterns: ["/node_modules/", "/dist/"],
    maxWorkers: "50%",
    globalSetup: "./jest.setup.ts",
    globalTeardown: "./jest.teardown.ts",
    snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
};
