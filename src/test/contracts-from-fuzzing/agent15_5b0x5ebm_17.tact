contract TestRawSlice {
    receive() {
        // Test the rawSlice compile-time function
        let rs: Slice = rawSlice("000DEADBEEF000");
        dump(rs);
    }
}
