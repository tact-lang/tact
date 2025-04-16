fun testLongStringHash(): Int {
    // 130 characters
    let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    return s.hashData();
}

contract Test {
    receive() {
        testLongStringHash();
    }
}