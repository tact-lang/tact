contract Test {
    receive() {
        // Using a ternary expression to simulate an optional value
        dump(true ? 123 : null);
    }
}
