contract Test {
    // Testing ton() with a dot but no fractional digits.
    // According to format, "1." may be considered invalid or may be trimmed.
    // We want to see if the compiler handles "1." or complains.
    v: Int = ton("1.");
}
