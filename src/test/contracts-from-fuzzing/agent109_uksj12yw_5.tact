fun test_eq(): Bool {
    // Testing equality of two identical string literals
    return "Tact strings" == "Tact strings";
}

contract TestContract {
    receive() {
        test_eq();
    }
}
