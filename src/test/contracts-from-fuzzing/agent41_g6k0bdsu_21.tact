contract TestNestedTernary {
    receive() {
        // According to Tact's precedence rules for nested ternary:
        // false ? 1 : false ? 2 : 3 should evaluate to 3
        let result: Int = false ? 1 : false ? 2 : 3;
        dump(result);
    }
}
