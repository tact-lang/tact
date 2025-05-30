contract TestTonLarge {
    // Testing ton() with a very large integer value. Expecting the compiler to multiply it by 10^9 without overflow if within limits
    value: Int = ton("999999999999999999999");

    receive() {}
}
