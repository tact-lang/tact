contract TestAsciiValid {
    // Using ascii function on a valid short string (3 bytes total)
    a: Int = ascii("abc");
    receive() {
        let s: String = "Test";
        let hash: Int = s.hashData();
        let _cmp: Bool = (hash > 0);
    }
}
