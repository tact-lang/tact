fun testLet() {
    let value: Int = 42;
    dump(value);
}

contract Test {
    receive() {
       testLet();
    }
}
