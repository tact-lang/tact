fun returnInt(): Int {
    return 42;
}

contract TestTypeInt {
    receive() {
        returnInt();
    }
}
