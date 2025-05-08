contract DebugTestOptionalSome {
    // Test dump() with an optional int having a value (assigned via reassignment)
    receive() {
        let x: Int? = null;
        x = 123;
        dump(x);
    }
}
