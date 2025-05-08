contract Test {
    receive() {
        // Testing ascii() with exactly 8 emoji characters (each emoji is 4 bytes, total 32 bytes)
        let a = ascii("😃😃😃😃😃😃😃😃");
    }
}
