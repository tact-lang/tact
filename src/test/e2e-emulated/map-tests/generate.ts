import { run } from "../../../node";
import { MapType, keyTypes, valTypes } from "./map-properties-key-value-types";
import { mkdir, writeFile } from "fs/promises";
import { readFileSync } from "fs";
import path from "path";
import { exit } from "node:process";

const pwd = (fileName: string): string => path.join(__dirname, fileName);

const testDirectory = (testName: string): string =>
    pwd(`./build/instance_${testName}`);

const testContractFileName = "test.tact";
const specFileName = "map-properties.spec.ts";

const instantiateContractTemplateAndSpec = async (
    templateTact: string,
    templateSpec: string,
    testName: string,
    key: MapType,
    val: MapType,
): Promise<string> => {
    const tactSourceCode = templateTact
        .replaceAll("KEY_TYPE", key.type)
        .replaceAll("VAL_TYPE", val.type);
    const testDir = testDirectory(testName);
    await mkdir(testDir, { recursive: true });
    const tactFilePath = path.join(testDir, testContractFileName);
    await writeFile(tactFilePath, tactSourceCode);
    const specSourceCode = templateSpec
        .replaceAll("KEY_1", key.val1)
        .replaceAll("KEY_2", key.val2)
        .replaceAll("VAL_1", val.val1)
        .replaceAll("VAL_2", val.val2);
    const specFilePath = path.join(testDir, specFileName);
    await writeFile(specFilePath, specSourceCode);
    return tactFilePath;
};

const templateTactSourceCode: string = readFileSync(
    pwd("map-properties.tact.template"),
).toString();

const templateSpecSourceCode: string = readFileSync(
    pwd("map-properties.spec.ts.template"),
).toString();

const compileContracts = async () => {
    for (const key of keyTypes) {
        for (const val of valTypes) {
            const testName = `${key.type}_${val.type}`.replaceAll(" ", "-");
            const tactFilePath = await instantiateContractTemplateAndSpec(
                templateTactSourceCode,
                templateSpecSourceCode,
                testName,
                key,
                val,
            );
            const compilationResult = await run({
                fileName: tactFilePath,
                suppressLog: true,
            });
            if (!compilationResult.ok) {
                console.error(compilationResult.error);
                exit(1);
            }
        }
    }
};

const main = async () => {
    try {
        await compileContracts();
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
