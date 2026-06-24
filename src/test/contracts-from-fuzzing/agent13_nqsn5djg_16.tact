fun testNewlineAscii(): Int {
    return ascii("\n");
}

contract Test {
    receive() {
        let x = testNewlineAscii();
        dump(x);
    }
}