contract TestPrecedence {
    receive() {
        // Testing arithmetic operator precedence with parentheses

        // Without parentheses: multiplication has higher precedence than subtraction
        let a: Int = 5 * 5 - 2;   // Expected: 25 - 2 = 23
        dump(a);

        // With parentheses: subtraction happens before multiplication
        let b: Int = 5 * (5 - 2); // Expected: 5 * 3 = 15
        dump(b);

        // Testing nested ternary (?:) operator; according to documentation, alternative cases are right-associative
        let c: Int = false ? 1 : true ? 2 : 3; // Expected: 2
        dump(c);
    }
}
