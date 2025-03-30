/**
 * Copyright (c) Whales Corp.
 * All Rights Reserved.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

import Prando from "prando";
import { Address } from "../address/address";
import { ExternalAddress } from "../address/external-address";
import { bitsForNumber } from "./bits-for-number";

export function testAddress(workchain: number, seed: string) {
    const random = new Prando(seed);
    const hash = Buffer.alloc(32);
    for (let i = 0; i < hash.length; i++) {
        hash[i] = random.nextInt(0, 255);
    }
    return new Address(workchain, hash);
}

export function testExternalAddress(seed: string) {
    const random = new Prando(seed);
    const hash = Buffer.alloc(32);
    for (let i = 0; i < hash.length; i++) {
        hash[i] = random.nextInt(0, 255);
    }
    const v = BigInt("0x" + hash.toString("hex"));
    return new ExternalAddress(v, bitsForNumber(v, "uint"));
}
