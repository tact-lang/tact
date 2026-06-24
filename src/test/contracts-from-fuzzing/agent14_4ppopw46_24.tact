contract TestCrc32 {
    receive() {
        // Test the crc32() compile-time function
        let c: Int = crc32("000DEADBEEF000");
        dump(c);
    }
}
