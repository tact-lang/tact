fun eqStrings(a: String, b: String): Bool {
    return a == b;
}

contract Test {
    receive() {
        let eq = eqStrings("Hello", "Hello");
    }
}