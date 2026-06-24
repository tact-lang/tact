fun getValue(): Int {
    return 42;
}

contract CallInDefault {
    x: Int = getValue();

    receive() { getValue(); }
}