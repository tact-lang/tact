/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import { sha256_sync, sign, signVerify } from "@ton/crypto";
import type { Cell } from "@/core/boc/cell";

const MIN_SEED_LENGTH = 8;
const MAX_SEED_LENGTH = 64;

function createSafeSignHash(cell: Cell, seed: string) {
    const seedData = Buffer.from(seed);
    if (seedData.length > MAX_SEED_LENGTH) {
        throw Error("Seed can\t be longer than 64 bytes");
    }
    if (seedData.length < MIN_SEED_LENGTH) {
        throw Error("Seed must be at least 8 bytes");
    }
    return sha256_sync(
        Buffer.concat([Buffer.from([0xff, 0xff]), seedData, cell.hash()]),
    );
}

export function safeSign(
    cell: Cell,
    secretKey: Buffer,
    seed: string = "ton-safe-sign-magic",
) {
    return sign(createSafeSignHash(cell, seed), secretKey);
}

export function safeSignVerify(
    cell: Cell,
    signature: Buffer,
    publicKey: Buffer,
    seed: string = "ton-safe-sign-magic",
) {
    return signVerify(createSafeSignHash(cell, seed), signature, publicKey);
}
