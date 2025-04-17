import { spawnSync } from "child_process";

const EXTENSIONS = ["js", "jsx", "ts", "tsx", "json", "css", "scss", "md"];
const args = process.argv.slice(2);
const checkOnly = args.includes("--check");
const prettierFlag = checkOnly ? "--check" : "--write";

const baseResult = spawnSync("git", ["merge-base", "HEAD", "main"], {
    encoding: "utf8",
});
if (baseResult.error) {
    console.error(baseResult.error);
    process.exit(1);
}
const base = baseResult.stdout.trim();
if (!base) {
    console.error("Failed to find merge base with main");
    process.exit(1);
}

const committed = spawnSync(
    "git",
    ["diff", "--name-only", "--diff-filter=ACM", base, "HEAD"],
    { encoding: "utf8" },
);
if (committed.error) {
    console.error(committed.error);
    process.exit(1);
}

const staged = spawnSync("git", ["diff", "--name-only", "--cached"], {
    encoding: "utf8",
});
if (staged.error) {
    console.error(staged.error);
    process.exit(1);
}

const unstaged = spawnSync("git", ["diff", "--name-only"], {
    encoding: "utf8",
});
if (unstaged.error) {
    console.error(unstaged.error);
    process.exit(1);
}

const untracked = spawnSync(
    "git",
    ["ls-files", "--others", "--exclude-standard"],
    { encoding: "utf8" },
);
if (untracked.error) {
    console.error(untracked.error);
    process.exit(1);
}

const fileSet = new Set<string>();
for (const list of [
    committed.stdout,
    staged.stdout,
    unstaged.stdout,
    untracked.stdout,
]) {
    list.split("\n")
        .filter(Boolean)
        .forEach((f) => fileSet.add(f));
}

const files = Array.from(fileSet).filter((f) =>
    EXTENSIONS.includes(f.split(".").pop() || ""),
);
if (files.length === 0) process.exit(0);

const result = spawnSync(
    "yarn",
    ["prettier", prettierFlag, "--ignore-unknown", ...files],
    { stdio: "inherit" },
);
if (result.error) {
    console.error(result.error);
    process.exit(1);
}
if (result.status && result.status !== 0) {
    process.exit(result.status);
}
