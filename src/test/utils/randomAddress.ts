import Prando from "prando";
import { Address } from "ton";

export function randomAddress(workchain: number, seed: string) {
    const random = new Prando(seed);
    const hash = Buffer.alloc(32);
    for (let i = 0; i < hash.length; i++) {
        hash[i] = random.nextInt(0, 255);
    }
    return new Address(workchain, hash);
}
