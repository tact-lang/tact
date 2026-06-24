contract Test {
    receive() {
        // Test the ternary operator: condition ? expr1 : expr2
        let r: Int = true ? 1 : 0;
        dump(r); // expected to dump 1

        let s: Int = false ? 1 : 99;
        dump(s); // expected to dump 99
    }
}
