function makeCRC32Table(polynomial: number): number[] {
    let c: number;
    const table = [];
    for (let n = 0; n < 256; n++) {
        c = n;
        for (let k = 0; k < 8; k++) {
            c = c & 1 ? (c >>> 1) ^ polynomial : c >>> 1;
        }
        table[n] = c;
    }
    return table;
}

const CRC32C_TABLE = makeCRC32Table(0xedb88320);

export function crc32(data: string | Buffer): number {
    if (!(data instanceof Buffer)) {
        data = Buffer.from(data);
    }

    let crc = 0xffffffff;
    for (const byte of data) {
        crc = CRC32C_TABLE[(crc ^ byte) & 0xff]! ^ (crc >>> 8);
    }

    return crc ^ 0xffffffff;
}
