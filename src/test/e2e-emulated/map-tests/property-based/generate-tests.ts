import * as fs from "fs";
import * as path from "path";
import { allInFolder } from "../../../utils/all-in-folder.build";
import { __DANGER__disableVersionNumber } from "../../../../pipeline/version";

const pwd = (fileName: string): string => path.join(__dirname, fileName);

const templateTestFilePath = pwd("map-property-based.spec.ts.template");
const outputTestDir = pwd("generated-tests");
const templateContractFilePath = pwd("map-property-based.tact.template");
const outputContractDir = pwd("contracts");

const keyTypeTemplate = "<__KEY_TYPE__>";
const keyTsTypeTemplate = "<__KEY_TS_TYPE__>";
const keyFilenameTemplate = "<__KEY_FILENAME__>";
const keyGeneratorTemplate = "<__KEY_GENERATOR__>";
const keyTypeNoSerializationTemplate = "<__KEY_TYPE_NO_SERIALIZATION__>";

const valueTypeTemplate = "<__VALUE_TYPE__>";
const valueTsTypeTemplate = "<__VALUE_TS_TYPE__>";
const valueFilenameTemplate = "<__VALUE_FILENAME__>";
const valueGeneratorTemplate = "<__VALUE_GENERATOR__>";
const valueTypeNoSerializationTemplate = "<__VALUE_TYPE_NO_SERIALIZATION__>";

const keyTypes = [
    "Int",
    "Address",
    "Int as uint64",
    "Int as uint128",
    "Int as uint256",
    "Int as int64",
    "Int as int128",
    "Int as int256",
    "Int as int257",
] as const;

const valueTypes = [
    "Int",
    "Bool",
    "Address",
    "Cell",
    "Int as uint64",
    "Int as uint128",
    "Int as uint256",
    "Int as int64",
    "Int as int128",
    "Int as int256",
    "Int as int257",
] as const;

type keyValueTypes = (typeof keyTypes)[number] | (typeof valueTypes)[number];

function getTypeNoSerialization(type: keyValueTypes): string {
    return type.split(" as ")[0] ?? type;
}

const typeGenerators: Record<keyValueTypes, string> = {
    Int: "fc.bigInt",
    Address: "_generateAddressLocal",
    Bool: "fc.boolean",
    Cell: "_generateCell",
    // "Int as uint8": "",
    // "Int as uint16": "fc.bigInt",
    // "Int as uint32": "fc.bigInt",
    "Int as uint64": "(() => _generateIntBitLength(64, false))",
    "Int as uint128": "(() => _generateIntBitLength(128, false))",
    "Int as uint256": "(() => _generateIntBitLength(256, false))",
    // "Int as int8": "fc.bigInt",
    // "Int as int16": "fc.bigInt",
    // "Int as int32": "fc.bigInt",
    "Int as int64": "(() => _generateIntBitLength(64))",
    "Int as int128": "(() => _generateIntBitLength(128))",
    "Int as int256": "(() => _generateIntBitLength(256))",
    "Int as int257": "(() => _generateIntBitLength(257))",
    // "Int as coins": "fc.bigInt",
};

const tsTypeMapping: Record<
    (typeof keyTypes)[number] | (typeof valueTypes)[number],
    string
> = {
    Int: "bigint",
    Address: "Address",
    Bool: "boolean",
    Cell: "Cell",
    // "Int as uint8": "bigint",
    // "Int as uint16": "bigint",
    // "Int as uint32": "bigint",
    "Int as uint64": "bigint",
    "Int as uint128": "bigint",
    "Int as uint256": "bigint",
    // "Int as int8": "bigint",
    // "Int as int16": "bigint",
    // "Int as int32": "bigint",
    "Int as int64": "bigint",
    "Int as int128": "bigint",
    "Int as int256": "bigint",
    "Int as int257": "bigint",
    // "Int as coins": "bigint",
};

const main = async () => {
    // Ensure the output directories exists
    if (!fs.existsSync(outputTestDir)) {
        fs.mkdirSync(outputTestDir);
    }
    if (!fs.existsSync(outputContractDir)) {
        fs.mkdirSync(outputContractDir);
    }

    const templateTest = fs.readFileSync(templateTestFilePath, "utf-8");
    const templateContract = fs.readFileSync(templateContractFilePath, "utf-8");

    // Generate files for all combinations of types
    for (const keyType of keyTypes) {
        for (const valueType of valueTypes) {
            const keyFilenameSuffix = keyType.replaceAll(" ", "-");
            const valueFilenameSuffix = valueType.replaceAll(" ", "-");

            const outputFileName = `map-property-based-${keyFilenameSuffix}-${valueFilenameSuffix}`;

            const typedTest = templateTest
                .replaceAll(keyTsTypeTemplate, tsTypeMapping[keyType])
                .replaceAll(valueTsTypeTemplate, tsTypeMapping[valueType])
                .replaceAll(keyFilenameTemplate, keyFilenameSuffix)
                .replaceAll(valueFilenameTemplate, valueFilenameSuffix)
                .replaceAll(keyGeneratorTemplate, typeGenerators[keyType])
                .replaceAll(valueGeneratorTemplate, typeGenerators[valueType]);

            const testFilePath = path.join(
                outputTestDir,
                outputFileName + ".spec.ts",
            );
            fs.writeFileSync(testFilePath, typedTest);

            const typedContract = templateContract
                .replaceAll(keyTypeTemplate, keyType)
                .replaceAll(valueTypeTemplate, valueType)
                .replaceAll(
                    keyTypeNoSerializationTemplate,
                    getTypeNoSerialization(keyType),
                )
                .replaceAll(
                    valueTypeNoSerializationTemplate,
                    getTypeNoSerialization(valueType),
                );

            const contractFilePath = path.join(
                outputContractDir,
                outputFileName + ".tact",
            );
            fs.writeFileSync(contractFilePath, typedContract);
        }
    }

    // Disable version number in packages
    __DANGER__disableVersionNumber();

    // Compile generated contracts
    await allInFolder(__dirname, [path.join(outputContractDir, "*.tact")]);
};

void main();
