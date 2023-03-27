/** @type {import('ts-jest/dist/types').InitialOptionsTsJest} */
module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  testPathIgnorePatterns: ["/node_modules/","/dist/"],
  maxWorkers: 1,
  globalSetup: './jest.setup.js',
  globalTeardown: './jest.teardown.js',
};