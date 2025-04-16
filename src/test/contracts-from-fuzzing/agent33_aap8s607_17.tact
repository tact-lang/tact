contract TestNestedTernaryValid {
    receive() {
        // Valid nesting of ternary operators: alternative case is nested without extra parentheses
        // According to documentation, nesting without parentheses in alternative is allowed.
        let result: Int = false ? 1 : true ? 2 : 3;  // expected result: 2
    }
}
