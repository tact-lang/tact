contract ConstAsciiTest {
    // ascii("abc") should evaluate to 0x616263, which is 6382179 in decimal
    const ASCII_ABC: Int = ascii("abc");

    receive() {
         require(self.ASCII_ABC == 6382179, "ascii(\"abc\") did not evaluate to 6382179");
         cashback(sender());
    }
}
