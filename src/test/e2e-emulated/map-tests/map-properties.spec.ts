import { run } from "../../../node";
import { MapType, keyTypes, valTypes } from "./map-properties-key-value-types";
import { mkdir, writeFile } from "fs/promises";
import { readFileSync } from "fs";
import path from "path";
import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import {MapPropertiesTester} from "./build/contract-instance_Int-as-varuint32_Address/test_MapPropertiesTester";

const pwd = (fileName: string): string => path.join(__dirname, fileName);

const instantiateContractTemplate = async (
    template: string,
    testName: string,
    key: MapType,
    val: MapType,
): Promise<string> => {
    const sourceCode = template
        .replaceAll("KEY_TYPE", key.type)
        .replaceAll("VAL_TYPE", val.type);
    const contractDir = pwd(`./build/contract-instance_${testName}`);
    await mkdir(contractDir, { recursive: true });
    const tactFilePath = path.join(contractDir, "test.tact");
    await writeFile(tactFilePath, sourceCode);
    return tactFilePath;
};

describe("map properties", () => {
    const templateSourceCode = readFileSync(
        pwd("map-properties.tact"),
    ).toString();
    for (const key of keyTypes) {
        for (const val of valTypes) {
            const testName = `${key.type}_${val.type}`.replaceAll(" ", "-");
            it(`should pass map property tests for ${testName}`, async () => {
                const tactFilePath = await instantiateContractTemplate(
                    templateSourceCode,
                    testName,
                    key,
                    val,
                );
                const compilationResult = await run({
                    fileName: tactFilePath,
                    suppressLog: true,
                });
                expect(compilationResult.ok).toBe(true);
                // const contractDir = pwd(
                //     `./build/contract-instance_${testName}`,
                // );
                // //import `${contractDir}/test_MapPropertiesTester`;

                // let blockchain: Blockchain;
                // let treasure: SandboxContract<TreasuryContract>;
                // let contract: SandboxContract<MapPropertiesTester>;

                // blockchain = await Blockchain.create();
                // blockchain.verbosity.print = false;
                // treasure = await blockchain.treasury("treasure");
                // contract = blockchain.openContract(
                //     await bindings.MapPropertiesTester.fromInit(),
                // );

                // const result = await contract.send(
                //     treasure.getSender(),
                //     {
                //         value: toNano("10"),
                //     },
                //     null, // No specific message, sending a basic transfer
                // );

                // expect(result.transactions).MapPropertiesTester({
                //     from: treasure.address,
                //     to: contract.address,
                //     success: true,
                //     deploy: true,
                // });

                // TODO:
                // - deal with TS bindings
                // - call all the getters
            });
        }
    }
});
