import { sha256_sync } from "@ton/crypto";

const prefix = "TESTSEED";

export function testSubwalletId(seed: string): bigint {
    return BigInt("0x" + sha256_sync(prefix + seed).toString("hex"));
}
