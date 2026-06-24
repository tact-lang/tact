contract Test {
    receive() {
        let opt: Int? = 42;
        dump(opt); // Expect dump to print the optional value containing 42
    }
}
