import { inspect } from "util";
import * as allure from "allure-js-commons";
import {Blockchain} from "@ton/sandbox";

declare global {
    interface BigInt {
        toJSON(): number;
    }
}

BigInt.prototype.toJSON = function () { return Number(this) }
const originalCreate: typeof Blockchain.create = Blockchain.create;

Blockchain.create = (async function proxy(
    this: typeof Blockchain,
    ...args: Parameters<typeof Blockchain.create>
) {
    return allure.step("Blockchain.create()", () =>
        originalCreate.apply(this, args)
    );
}) as typeof Blockchain.create;

const originalTreasury: typeof Blockchain.prototype.treasury = Blockchain.prototype.treasury;

Blockchain.prototype.treasury = async function proxyTreasury(
    this: Blockchain,
    ...args: Parameters<typeof originalTreasury>
) {
    const argStr = args
        .map(safeString)
        .join(", ");

    const label = `Blockchain.treasury(${argStr})`;

    return await allure.step(label, () => originalTreasury.apply(this, args));
} as typeof originalTreasury;


// const originalOpenContract: typeof Blockchain.prototype.openContract =
//     Blockchain.prototype.openContract;
//
// Blockchain.prototype.openContract = function proxyOpenContract(
//     this: Blockchain,
//     ...args: Parameters<typeof originalOpenContract>
// ) {
//     // const argStr = args
//     //     .map(safeString)
//     //     .join(", ");
//
//     const label = `Blockchain.openContract()`;
//
//     return allure.step(label, () => originalOpenContract.apply(this, args));
// } as typeof originalOpenContract;

function safeString(v: unknown): string {
    if (v === null || v === undefined) return String(v);
    if (typeof v === "string" || typeof v === "number" || typeof v === "boolean") {
        return JSON.stringify(v);
    }

    return inspect(v, { depth: 1, breakLength: 50 });
}




