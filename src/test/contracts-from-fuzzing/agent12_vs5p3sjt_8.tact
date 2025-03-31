fun testUnicode3(): String {
    return "bunny: \u{1F430}";
}

contract TestUnicode3 {
    receive() {
        testUnicode3();
    }
}
