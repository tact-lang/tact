import Prando from "prando";
import type { KeyPair } from "@ton/crypto";
import { keyPairFromSeed } from "@ton/crypto";
import { Address } from "@ton/core";

export function randomKey(seed: string): KeyPair {
    const random = new Prando(seed);
    const res = Buffer.alloc(32);
    for (let i = 0; i < res.length; i++) {
        res[i] = random.nextInt(0, 256);
    }
    return keyPairFromSeed(res);
}

export function randomAddress(workchain: number, seed: string): Address {
    const random = new Prando(seed);
    const hash = Buffer.alloc(32);
    for (let i = 0; i < hash.length; i++) {
        hash[i] = random.nextInt(0, 255);
    }
    return new Address(workchain, hash);
}
