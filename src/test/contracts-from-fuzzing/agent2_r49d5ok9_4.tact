contract TestOptionalNull {
    // Test dump() with a null value representing an optional or absence of value
    receive() {
        dump(null);
    }
}
