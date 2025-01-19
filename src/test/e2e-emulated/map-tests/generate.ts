import { run } from "../../../node";
import { keyTypes, valTypes } from "./map-properties-key-value-types";
import { mkdir, writeFile } from "fs/promises";
import path from "path";
import { exit } from "node:process";
import {
    descriptionToString,
    intKeyFormats,
    intValFormats,
    maxInt,
    minInt,
} from "./map-int-limits-key-value-types";
import { readFile } from "node:fs/promises";

type TestKind = "map-properties" | "map-int-limits";

// template with substitutions that make it an instance after application
type TemplateWithSubst = {
    template: string;
    subst: Map<string, string>;
};

const pwd = (fileName: string): string => path.join(__dirname, fileName);

const testDirectory = (kind: TestKind, testName: string): string =>
    pwd(`./build/${kind}_${testName}`.replaceAll(" ", "-"));

const testContractFileName = "test.tact";

const applySubstitutions = ({ template, subst }: TemplateWithSubst): string => {
    return Array.from(subst).reduce(
        (partialTemplate, [placeholder, concreteValue]) => {
            return partialTemplate.replaceAll(placeholder, concreteValue);
        },
        template,
    );
};

const instantiateContractAndSpecTemplates = async (
    testKind: TestKind,
    testName: string,
    templateTact: TemplateWithSubst,
    templateSpec: TemplateWithSubst,
): Promise<string> => {
    const testDir = testDirectory(testKind, testName);
    const tactSourceCode = applySubstitutions(templateTact);
    const specSourceCode = applySubstitutions(templateSpec);
    await mkdir(testDir, { recursive: true });
    const tactFilePath = path.join(testDir, testContractFileName);
    await writeFile(tactFilePath, tactSourceCode);
    const specFilePath = path.join(testDir, `${testKind}.spec.ts`);
    await writeFile(specFilePath, specSourceCode);
    return tactFilePath;
};

const compileAndExitOnError = async (tactFilePath: string) => {
    const compilationResult = await run({
        fileName: tactFilePath,
        suppressLog: true,
    });
    if (!compilationResult.ok) {
        console.error(compilationResult.error);
        exit(1);
    }
};

const generatePropertyTests = async () => {
    const templateTactSourceCodeProperties: string = (
        await readFile(pwd("map-properties.tact.template"))
    ).toString();
    const templateSpecSourceCodeProperties: string = (
        await readFile(pwd("map-properties.spec.ts.template"))
    ).toString();
    for (const key of keyTypes) {
        for (const val of valTypes) {
            const testName = `${key.type}_${val.type}`;
            const tactFilePath = await instantiateContractAndSpecTemplates(
                "map-properties",
                testName,
                {
                    template: templateTactSourceCodeProperties,
                    subst: new Map([
                        ["KEY_TYPE_PLACEHOLDER", key.type],
                        ["VAL_TYPE_PLACEHOLDER", val.type],
                    ]),
                },
                {
                    template: templateSpecSourceCodeProperties,
                    subst: new Map([
                        ["KEY_1_PLACEHOLDER", key._1],
                        ["KEY_2_PLACEHOLDER", key._2],
                        ["VAL_1_PLACEHOLDER", val._1],
                        ["VAL_2_PLACEHOLDER", val._2],
                    ]),
                },
            );
            await compileAndExitOnError(tactFilePath);
        }
    }
};

const generateIntLimitsTests = async () => {
    const templateTactSourceCodeLimits: string = (
        await readFile(pwd("map-int-limits.tact.template"))
    ).toString();
    const templateSpecSourceCodeLimits: string = (
        await readFile(pwd("map-int-limits.spec.ts.template"))
    ).toString();
    for (const key of intKeyFormats) {
        for (const val of intValFormats) {
            const testName = `${descriptionToString(key)}_${descriptionToString(val)}`;
            const tactFilePath = await instantiateContractAndSpecTemplates(
                "map-int-limits",
                testName,
                {
                    template: templateTactSourceCodeLimits,
                    subst: new Map([
                        ["KEY_FORMAT_PLACEHOLDER", descriptionToString(key)],
                        ["VAL_FORMAT_PLACEHOLDER", descriptionToString(val)],
                        ["KEY_MIN_PLACEHOLDER", minInt(key).toString()],
                        ["KEY_MAX_PLACEHOLDER", maxInt(key).toString()],
                        ["VAL_MIN_PLACEHOLDER", minInt(val).toString()],
                        ["VAL_MAX_PLACEHOLDER", maxInt(val).toString()],
                    ]),
                },
                {
                    template: templateSpecSourceCodeLimits,
                    subst: new Map(),
                },
            );
            await compileAndExitOnError(tactFilePath);
        }
    }
};

const main = async () => {
    try {
        await generatePropertyTests();
        await generateIntLimitsTests();
    } catch (e) {
        console.error(e);
        process.exit(1);
    }
};

void main();
