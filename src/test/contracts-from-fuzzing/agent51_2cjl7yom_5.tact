contract Test {
    receive() {
        let s: String = "hello";
        let hash_val: Int = s.hashData();
    }
}
