contract TestTernaryExpressions {
    receive() {
        // Ternary operator test cases
        dump(true ? "Yes" : "No");             // expected: "Yes"
        dump((1 + 2 == 3) ? 10 : 20);                // expected: 10
        dump(false ? 1 : (false ? 2 : 3));            // expected: 3

        // Conditional usage in assignment
        let x: Int = (5 > 3) ? 100 : 200;              // expected: 100
        dump(x);
    }
}
