import Prando from "prando";
import { keyPairFromSeed } from "@ton/crypto";

export function testKey(seed: string) {
    const random = new Prando(seed);
    const res = Buffer.alloc(32);
    for (let i = 0; i < res.length; i++) {
        res[i] = random.nextInt(0, 256);
    }
    return keyPairFromSeed(res);
}
