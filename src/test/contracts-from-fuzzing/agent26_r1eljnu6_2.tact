fun testBool(): Bool {
    return true;
}

contract Test {
    receive() {
        let x = testBool();
    }
}