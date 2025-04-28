module.exports = {
    preset: "ts-jest",
    transform: {
        "^.+\\.(t|j)sx?$": "@swc/jest",
    },
    moduleNameMapper: {
        "^@/(.*)$": "<rootDir>/src/$1",
    },
    testEnvironment: "node",
    testPathIgnorePatterns: ["/node_modules/", "/dist/"],
    globalSetup: "./vitest.globalSetup.js",
    setupFiles: ["./vitest.setup.ts"],
    globalTeardown: "./jest.teardown.js",
    snapshotSerializers: ["@tact-lang/ton-jest/serializers"],
    maxWorkers: "4",
    testTimeout: 10000,
};
