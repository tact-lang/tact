const baseConfig = require('./jest.config.js');

module.exports = {
    ...baseConfig,
    testMatch: ['**/src/benchmarks/**/*.spec.ts'],
    testPathIgnorePatterns: ['/node_modules/', '/dist/', '.*\\.test\\.spec\\.ts$'],
}; 