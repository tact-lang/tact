import { run } from "../../../node";
import { MapType, keyTypes, valTypes } from "./map-properties-key-value-types";
import { mkdir, writeFile } from "fs/promises";
import path from "path";
import { exit } from "node:process";
import {
    descriptionToString,
    intKeyFormats,
    intValFormats,
    MapIntKeyDescription,
    MapIntValDescription,
    maxInt,
    minInt,
} from "./map-int-limits-key-value-types";
import { readFile } from "node:fs/promises";

type TestKind = "property" | "int-limits";

const pwd = (fileName: string): string => path.join(__dirname, fileName);

const testDirectory = (kind: TestKind, testName: string): string =>
    pwd(`./build/${kind}_${testName}`);

const testContractFileName = "test.tact";
const specFileNameProperties = "map-properties.spec.ts";
const specFileNameLimits = "map-int-limits.spec.ts";

const instantiateContractTemplateAndSpecProperties = async (
    templateTact: string,
    templateSpec: string,
    testName: string,
    key: MapType,
    val: MapType,
): Promise<string> => {
    const tactSourceCode = templateTact
        .replaceAll("KEY_TYPE", key.type)
        .replaceAll("VAL_TYPE", val.type);
    const testDir = testDirectory("property", testName);
    await mkdir(testDir, { recursive: true });
    const tactFilePath = path.join(testDir, testContractFileName);
    await writeFile(tactFilePath, tactSourceCode);
    const specSourceCode = templateSpec
        .replaceAll("KEY_1", key.val1)
        .replaceAll("KEY_2", key.val2)
        .replaceAll("VAL_1", val.val1)
        .replaceAll("VAL_2", val.val2);
    const specFilePath = path.join(testDir, specFileNameProperties);
    await writeFile(specFilePath, specSourceCode);
    return tactFilePath;
};

const instantiateContractTemplateAndSpecLimits = async (
    templateTact: string,
    templateSpec: string,
    testName: string,
    key: MapIntKeyDescription,
    val: MapIntValDescription,
): Promise<string> => {
    const tactSourceCode = templateTact
        .replaceAll("KEY_FORMAT_PLACEHOLDER", descriptionToString(key))
        .replaceAll("VAL_FORMAT_PLACEHOLDER", descriptionToString(val))
        .replaceAll("KEY_MIN_PLACEHOLDER", minInt(key).toString())
        .replaceAll("KEY_MAX_PLACEHOLDER", maxInt(key).toString())
        .replaceAll("VAL_MIN_PLACEHOLDER", minInt(val).toString())
        .replaceAll("VAL_MAX_PLACEHOLDER", maxInt(val).toString());
    const testDir = testDirectory("int-limits", testName);
    await mkdir(testDir, { recursive: true });
    const tactFilePath = path.join(testDir, testContractFileName);
    await writeFile(tactFilePath, tactSourceCode);
    const specSourceCode = templateSpec;
    const specFilePath = path.join(testDir, specFileNameLimits);
    await writeFile(specFilePath, specSourceCode);
    return tactFilePath;
};

const compileContracts = async () => {
    // compile map properties contracts
    const templateTactSourceCodeProperties: string = (
        await readFile(pwd("map-properties.tact.template"))
    ).toString();
    const templateSpecSourceCodeProperties: string = (
        await readFile(pwd("map-properties.spec.ts.template"))
    ).toString();
    for (const key of keyTypes) {
        for (const val of valTypes) {
            const testName = `${key.type}_${val.type}`.replaceAll(" ", "-");
            const tactFilePath =
                await instantiateContractTemplateAndSpecProperties(
                    templateTactSourceCodeProperties,
                    templateSpecSourceCodeProperties,
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
    // compile int map limit contracts
    const templateTactSourceCodeLimits: string = (
        await readFile(pwd("map-int-limits.tact.template"))
    ).toString();
    const templateSpecSourceCodeLimits: string = (
        await readFile(pwd("map-int-limits.spec.ts.template"))
    ).toString();
    for (const key of intKeyFormats) {
        for (const val of intValFormats) {
            const testName =
                `${descriptionToString(key)}_${descriptionToString(val)}`.replaceAll(
                    " ",
                    "-",
                );
            const tactFilePath = await instantiateContractTemplateAndSpecLimits(
                templateTactSourceCodeLimits,
                templateSpecSourceCodeLimits,
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
