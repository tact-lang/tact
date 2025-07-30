contract Test {
    // Test combining literal text receiver and arbitrary text receiver
    // Expect: literal text receiver should have priority for "hello" messages
    receive("hello") { /* handle 'hello' */ }
    receive(str: String) { /* handle all other text messages */ }
}
