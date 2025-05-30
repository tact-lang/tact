/* Test Case 5: Valid usage of codeOf for a contract with an explicit init() function */
contract D {
    init() {
        // explicit initialization, though empty
    }

    receive() {}
}

contract TestD {
    receive() {
        let codeCell = codeOf D;
    }
}
