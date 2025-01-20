// Call the script with a new dev version as its argument.
// If the argument is not provided a new version will be
// automatically generated from package.json and current date,
// plus a gitHead field with the current Git commit hash
// will be added to package.json.
//
// The version format should be as follows:
// <MAJOR>.<MINOR>.<PATCH>-dev.<ISO-8601-DATE-WITHOUT-DELIMITERS>
// e.g. something like 1.4.0-dev.20240711

import { execSync } from "child_process";
import { readFileSync, writeFileSync } from "fs";
import { join } from "path";
import { z } from "zod";

const packageSchema = z.object({
    version: z.string(),
});

const packageJsonPath = join(__dirname, "package.json");

const currentCommit = execSync("git rev-parse HEAD", {
    encoding: "utf-8",
}).trim();

const packageJson = JSON.parse(readFileSync(packageJsonPath, "utf-8"));
if (typeof packageJson !== "object" || packageJson === null) {
    throw new Error("package.json is not an object");
}

const generateVersion = () => {
    const oldVersion = packageSchema.parse(packageJson).version;
    const date = new Date().toISOString().substring(0, 10).replace("-", "");
    return `${oldVersion}-dev.${date}`;
};

const newPackageJson = {
    ...packageJson,
    version: process.argv[2] ?? generateVersion(),
    gitHead: currentCommit,
};

writeFileSync(packageJsonPath, JSON.stringify(newPackageJson, null, 2));

execSync(`yarn prettier -w "${packageJsonPath}"`);
