contract Test {
    get(crc32("crc32") + 42 & 0x3ffff | 0x4000) fun test(): Int {
        return 0;
    }
}

