fun getValue(): Int {
    return 42;
}

contract TestFunctionCall {
    receive() {
        dump(getValue());
    }
}
