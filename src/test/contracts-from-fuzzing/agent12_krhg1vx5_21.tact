contract Test {
    // Fuzz Test G.8: Use ton() with an extremely large number
    // This tests if the conversion handles large values without integer overflow at compile-time
    big: Int = ton("100000000000");

    receive() {}
}
