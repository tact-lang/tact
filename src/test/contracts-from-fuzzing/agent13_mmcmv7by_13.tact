contract DebugTestOptionalUpdated {
    // Testing dump() with an optional value that is non-null
    receive() {
        let a: Int? = 123;
        dump(a);
    }
}
