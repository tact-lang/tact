contract TestPrecedence {
    receive() {
        // No parentheses vs. parentheses
        let result1: Int = 5 * 5 - 2;    // Expected: 23 (5*5=25, 25-2=23)
        let result2: Int = 5 * (5 - 2);    // Expected: 15 (5-2=3, 5*3=15)
        dump(result1);
        dump(result2);
    }
}
