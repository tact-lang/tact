import { join } from "path";
import { execFileSync } from "child_process";

const rootPath = join(__dirname, "..", "..");

export function showCommit() {
    // if working inside a git repository
    // also print the current git commit hash
    try {
        const gitCommit = execFileSync(
            "git",
            [`--git-dir=${join(rootPath, ".git")}`, "rev-parse", "HEAD"],
            {
                encoding: "utf8",
                stdio: ["ignore", "pipe", "ignore"],
                cwd: rootPath,
            },
        ).trim();
        console.log(`git commit: ${gitCommit}`);
    } finally {
        process.exit(0);
    }
}

export function getVersion() {
    return "%VERSION%";
}
