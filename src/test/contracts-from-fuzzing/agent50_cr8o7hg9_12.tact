contract TestZeroRepeat {
    receive() {
        let x: Int = 1;
        // repeat with zero iterations (should do nothing)
        repeat (0) {
            x *= 2;
        }
        dump(x); // expects 1
    }
}
