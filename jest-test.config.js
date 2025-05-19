const baseConfig = require('./jest.config.js');

module.exports = {
    ...baseConfig,
    testMatch: ['**/src/benchmarks/**/*.test.spec.ts'],
    testPathIgnorePatterns: ['/node_modules/', '/dist/'],
}; 