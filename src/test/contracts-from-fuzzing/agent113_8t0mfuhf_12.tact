contract FinalSemicolonTest {
    // Function with explicit return at the end of the block, without a trailing semicolon
    fun f(x: Int): Int { return x + 1 }

    receive() {}
}
