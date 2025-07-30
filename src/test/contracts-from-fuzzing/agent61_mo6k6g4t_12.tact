contract Test {
    receive() {
        let a: Int = 10;
        // Error: Missing parentheses around condition
        if a > 5 {
            dump(a);
        }
    }
}
