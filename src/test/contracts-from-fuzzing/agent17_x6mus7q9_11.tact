contract TestInitOf {
    fun run() {
        // Test use of initOf and codeOf as compile-time expressions for the current contract
        // We avoid dumping the StateInit type directly to prevent a compilation error
        let _ = initOf TestInitOf();
        let codeValue: Cell = codeOf TestInitOf;
        dump(codeValue);
    }
    receive() {
        self.run();
    }
}
