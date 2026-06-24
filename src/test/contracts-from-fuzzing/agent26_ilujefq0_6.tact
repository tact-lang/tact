fun intToString(): String {
    return 123.toString();
}

contract TypeCoercionTest {
    receive() {
        intToString();
    }
}
