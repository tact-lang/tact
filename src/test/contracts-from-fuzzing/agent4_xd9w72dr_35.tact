contract TestTonEmpty {
    // Testing ton with an empty string; expected to fail
    value: Int = ton("");
    receive () {}
}
