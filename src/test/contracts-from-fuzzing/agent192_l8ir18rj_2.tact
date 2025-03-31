contract TestComment {
    receive("hello") {
        // specific text handler, matches only "hello" messages
    }
}