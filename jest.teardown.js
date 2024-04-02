const coverage = require("@tact-lang/coverage");
const path = require("path");

module.exports = async () => {
    if (process.env.COVERAGE === "true") {
        coverage.completeCoverage([
            path.resolve(__dirname, "examples", "output", "*.boc"),
            path.resolve(
                __dirname,
                "src",
                "test",
                "features",
                "output",
                "*.boc",
            ),
            path.resolve(__dirname, "src", "test", "bugs", "output", "*.boc"),
            path.resolve(
                __dirname,
                "src",
                "benchmarks",
                "contracts",
                "output",
                "*.boc",
            ),
        ]);
    }
};
