import { Address } from "@/core";

export function randomAddress(workchain = 0): Address {
    const b = Buffer.alloc(32);
    for (let i = 0; i < 32; i++) {
        b[i] = Math.floor(Math.random() * 256);
    }
    return new Address(workchain, b);
}
