contract TestTernary {
    receive() {
        // Ternary operator expression
        let result: Int = (2 + 2 == 4) ? 100 : 200;
        dump(result); // Expected output: 100
    }
}
