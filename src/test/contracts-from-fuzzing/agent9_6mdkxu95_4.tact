contract TestContract {
    // default receiver
    receive() {}

    // Test dump() with null (optionals/null-like)
    receive("testOptional") {
        dump(null);
    }
}
