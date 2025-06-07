fun sameString(): Bool {
    return "Hello" == "Hello";
}

contract Test {
    receive() {
        sameString();
    }
}