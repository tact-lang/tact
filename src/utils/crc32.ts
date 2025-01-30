function makeCRC32Table(polynomial: number): Int32Array {
    let c: number;
    const table = new Int32Array(256);
    for (let n = 0; n < table.length; n++) {
        c = n;
        for (let k = 0; k < 8; k++) {
            c = c & 1 ? (c >>> 1) ^ polynomial : c >>> 1;
        }
        table[n] = c;
    }
    return table;
}

// Reversed polynomial of ISO3309 CRC32
const CRC32C_TABLE = makeCRC32Table(0xedb88320);

export function crc32(data: string | Uint8Array): number {
    if (typeof data === "string") {
        data = new TextEncoder().encode(data);
    }

    let crc = 0xffffffff;
    for (const byte of data) {
        crc = CRC32C_TABLE[(crc ^ byte) & 0xff]! ^ (crc >>> 8);
    }

    return crc ^ 0xffffffff;
}
