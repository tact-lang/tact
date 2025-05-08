contract TestBinaryOperators {
    receive() {
        // Testing binary operators: addition, subtraction, multiplication, division
        let add: Int = 1 + 2;       // should be 3
        let sub: Int = 5 - 3;       // should be 2
        let mul: Int = 4 * 2;       // should be 8
        let div: Int = 8 / 2;       // should be 4
        // Testing ternary operator
        let tern: String = (1 + 1 == 2) ? "yes" : "no";  // should be "yes"
    }
}
