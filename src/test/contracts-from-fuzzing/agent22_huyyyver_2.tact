contract TestTernary {
    receive() {
        // Ternary operator: false ? 1 : (true ? 2 : 3) should evaluate to 2
        let result = false ? 1 : (true ? 2 : 3);
        result; // forcing evaluation
    }
}
