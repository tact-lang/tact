import fs from "fs/promises";
import path from "path";
import pkg from "./package.json";

const root = __dirname;
const dist = path.join(root, "dist");

const filesToCopy = ["LICENSE", "README.md", "package.json"];
const dirsToCopy = ["bin"];
const versionFiles = ["cli/version.js", "pipeline/version.js"];

const main = async () => {
    await fs.mkdir(dist, { recursive: true });

    // copy files and folders to `dist/`, so that we don't have
    // dist in npm package
    for (const file of filesToCopy) {
        await fs.copyFile(path.join(root, file), path.join(dist, file));
    }

    for (const dir of dirsToCopy) {
        const srcDir = path.join(root, dir);
        const destDir = path.join(dist, dir);
        await fs.mkdir(destDir, { recursive: true });
        const entries = await fs.readdir(srcDir);
        for (const entry of entries) {
            await fs.copyFile(
                path.join(srcDir, entry),
                path.join(destDir, entry),
            );
        }
    }

    // there are files with %VERSION% substitution, so that
    // built package knows its own version
    for (const versionFile of versionFiles) {
        const fullPath = path.join(dist, versionFile);
        const code = await fs.readFile(fullPath, "utf8");
        const newCode = code.replace("%VERSION%", pkg.version);
        if (code === newCode) {
            throw new Error("Version substitution not found");
        }
        await fs.writeFile(fullPath, newCode);
    }

    // we mark package as private, so that it's impossible to publish from root
    const packageFile = path.join(dist, "package.json");
    const pkgJson = JSON.parse(await fs.readFile(packageFile, "utf-8"));
    delete pkgJson.private;
    delete pkgJson.devDependencies;
    delete pkgJson.scripts;
    await fs.writeFile(packageFile, JSON.stringify(pkgJson, null, 4));
};

void main();
