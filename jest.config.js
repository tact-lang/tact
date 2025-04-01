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
    setupFilesAfterEnv: ["./jest.setup.ts"],
    maxWorkers: "4",
    testTimeout: 10000,
};
