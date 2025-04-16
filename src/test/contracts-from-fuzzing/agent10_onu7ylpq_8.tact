contract Test {
    receive() {
        let s = rawSlice("FF");
        dump(s);
    }
}
