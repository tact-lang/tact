contract A {
    // Empty contract without parameters (uses implicit empty init())
    receive() {}
}

contract Test1 {
    receive() {
        // Using initOf with empty parentheses for a contract with no parameters
        let a_init = initOf A();
        // Using codeOf without parentheses
        let a_code = codeOf A;
    }
}
