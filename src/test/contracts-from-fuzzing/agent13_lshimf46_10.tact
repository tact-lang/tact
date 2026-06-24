contract TestTernary {
    receive() {
        // Ternary operator used in an assignment
        let a: Int = true ? 10 : 20;
        let b: Int = false ? 10 : 20;
    }
}
