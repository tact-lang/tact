contract DebugTestOptionalDirect {
    // Testing dump() with an explicit null value (optional)
    receive() {
        dump(null);
    }
}
