import Coverage from "@tact-lang/coverage";
import path from "path";
import { testPath } from "./src/test/path.build";

export default async () => {
    if (process.env.COVERAGE === "true") {
        Coverage.completeCoverage([
            path.join(__dirname, "examples", "output", "*.boc"),
            path.join(testPath, "codegen", "output", "*.boc"),
            path.join(testPath, "e2e-emulated", "output", "*.boc"),
            path.join(testPath, "contracts", "output", "*.boc"),
        ]);
    }
};
