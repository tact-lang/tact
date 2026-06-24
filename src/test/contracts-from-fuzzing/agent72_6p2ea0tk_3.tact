fun stringWithEscapes(): String {
    return "Line1\nLine2\tTabbed\"Quote\" End";
}

contract Test {
    receive() {
        stringWithEscapes();
    }
}
