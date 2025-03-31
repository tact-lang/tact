contract D {
    receive() {}
}

contract Tester5 {
    receive() {
        // Using initOf on a contract with no parameters (delayed initialization)
        let s = initOf D();
    }
}
