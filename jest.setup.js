const coverage = require('@tact-lang/coverage');

module.exports = async () => {
    if (process.env.COVERAGE === 'true') {
        coverage.beginCoverage();
    }
};