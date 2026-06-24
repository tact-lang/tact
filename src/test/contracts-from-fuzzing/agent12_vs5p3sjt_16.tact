fun testLargeBase64(): Slice {
    // 200 'A' characters, valid base64 but definitely more than 1023 bits when decoded
    let s: String = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    // decode it
    return s.fromBase64();
}

contract TestLargeBase64 {
    receive() {
        testLargeBase64();
    }
}
