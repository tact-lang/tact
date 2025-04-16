contract Test {
    receive() {
        let x: Int = 5;
        // valid assignment
        x = x + 1;
        // invalid usage of assignment in expression
        // The following line should cause a syntax error because assignment does not return a value
        // Uncommenting it should lead to a compiler error
        // let y: Int = (x = 10);
    }
}
