contract Test8 {
    // Test 8: rawSlice with an underscore only. This should fail because there's no valid hex before the underscore.
    stored: Slice = rawSlice("_");

    receive() {}
}
