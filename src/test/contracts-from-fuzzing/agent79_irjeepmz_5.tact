contract StringEscapeTest {
    receive() {
        // Testing basic string literal with escape sequences and conversion to Cell using asComment()
        dump("line \n another line".asComment());
    }
}
