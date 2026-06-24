contract TestBool {
    // Testing debug primitive dump() with a primitive bool type
    receive() {
        dump(true);
    }
}
