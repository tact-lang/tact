contract MultilineStringTest {
    receive() {
        // Testing string literal with an actual newline inside (should fail to compile)
        let s: String = "Line 1
Line 2";
    }
}
