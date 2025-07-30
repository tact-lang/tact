contract Test {
    const FLAG: Bool = true;

    get fun ret(): Int {
        // Compile-time branch elimination based on constant FLAG
        if (self.FLAG) {
            return 1;
        } else {
            return 0;
        }
    }

    receive() {}
}
