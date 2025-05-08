contract Test {
    receive() {
        // Test dump with an optional value directly assigned
        let opt: Int? = 123;
        dump(opt);
    }
}
