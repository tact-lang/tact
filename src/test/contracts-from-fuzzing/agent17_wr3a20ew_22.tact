contract Test {
    receive() {
        let n = crc32("Hello, World!");
    }
}