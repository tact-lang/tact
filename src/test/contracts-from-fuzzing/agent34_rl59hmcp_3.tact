fun testBoolean() {
    let b: Bool = true && false;
    dump(b); // expected output: false
}

contract TestBool {
    receive() {
        testBoolean();
    }
}
