contract Test {
    receive() {
        // Testing ton() with a trailing dot input to see if it produces an error (edge case)
        let t = ton("1.");
    }
}
