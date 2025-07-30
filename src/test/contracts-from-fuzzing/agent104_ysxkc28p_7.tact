// Test 1: Valid usage with a contract without parameters
contract A {
    receive() {}
}

contract Test1 {
    receive() {
        let a_init = initOf A();
        let a_code: Cell = codeOf A;
        // Force evaluation
        a_init.code;
    }
}
