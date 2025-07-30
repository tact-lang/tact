contract Test {
    // Multiple distinct literal receivers should compile
    receive("hello") { }
    receive("world") { }
}
