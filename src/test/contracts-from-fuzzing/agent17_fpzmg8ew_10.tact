contract UnusedGetter {
    val: Int = 123;

    // Getter declared but never used; should compile and be exported as off-chain getter
    get fun unused(): Int {
        return self.val;
    }

    receive() {}
}
