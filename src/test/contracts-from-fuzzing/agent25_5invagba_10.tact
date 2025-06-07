contract TestTernary {
    receive() {
        // Test a basic ternary expression: condition ? true_case : false_case
        let result1: Int = (10 > 5) ? 1 : 0;  // expected 1
        // Test nested ternary operator in alternative case
        let result2: Int = false ? 100 : (false ? 200 : 300); // expected 300
        // Test nested ternary operator in consequence requires extra parentheses
        let result3: Int = true ? (false ? 400 : 500) : 600; // expected 500
        dump(result1);
        dump(result2);
        dump(result3);
    }
}
