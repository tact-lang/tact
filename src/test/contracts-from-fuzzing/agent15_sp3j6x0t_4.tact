contract DebugTestOptionalNull {
    // Test dump() with a null value for an optional
    receive() {
        dump(null);
    }
}
