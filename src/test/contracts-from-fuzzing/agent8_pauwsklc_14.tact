fun multiLineAscii(): Int {
    // Attempt to see if an actual line break in the source is recognized
    return ascii("Hello
World");
}

contract Test {
    receive() {
        multiLineAscii();
    }
}
