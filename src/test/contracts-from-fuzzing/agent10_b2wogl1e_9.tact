contract TestBooleanLiteral() {
    fun run() {
        // Test boolean literals: true and false
        require(true, "True literal failed");
        require(!false, "False literal failed");
    }

    receive() {
        self.run();
    }
}
