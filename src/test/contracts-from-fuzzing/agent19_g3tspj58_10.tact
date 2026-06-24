contract Test9_ton_dot {
    // Testing ton() with a trailing dot in the value string. Expected to be rejected due to improper format.
    v: Int = ton("1.");

    // Minimal receive function
    receive() {}
}
