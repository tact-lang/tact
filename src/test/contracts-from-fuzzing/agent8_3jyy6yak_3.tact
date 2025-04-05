contract TestLiteralExpressions {
    receive() {
        // Integer literals
        dump(0);
        dump(-42);

        // Boolean literal
        dump(true);

        // String literal using asComment() extension
        dump("Hello, TON!".asComment());

        // Address literal (using address() constructor)
        dump(address("0:0000000000000000000000000000000000000000000000000000000000000000"));
    }
}
