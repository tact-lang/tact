contract C {
    init() {}
    receive() {}
}

contract TestC {
    receive() {
        // For a contract with an explicit init, even if parameterless, use initOf with parentheses
        let s = initOf C();
    }
}
