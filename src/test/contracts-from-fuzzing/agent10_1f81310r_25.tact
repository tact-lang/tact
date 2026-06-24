fun testHash128Bytes(): Int {
    /* Create a 128-bytes ASCII string, each char 'A'. That's 128 characters. */
    let s = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    // Attempt to call s.hashData(), which docs say can lead to collisions for strings longer than 127 bytes.
    return s.hashData();
}

contract TestContract {
    receive() {
        let h = testHash128Bytes();
    }
}
