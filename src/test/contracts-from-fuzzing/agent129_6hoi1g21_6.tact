contract Test {
    // Test 6: Overlapping text message receivers: literal vs generic
    receive("hello") { /* literal receiver */ }
    receive(msg: String) { /* generic text receiver */ }
}
