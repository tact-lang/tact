fun asciiTest(): Int {
    return ascii("Hello!");
}

contract Test {
    receive() {
        asciiTest();
    }
}
