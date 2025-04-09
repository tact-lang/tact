contract Test {
    const LOCAL: Int = 42;

    get fun ret(): Int {
        // Correctly reference a contract constant using self.
        return self.LOCAL;
    }

    receive() {}
}
