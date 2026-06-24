contract Test {
    // Attempt to store a fairly large string as a state variable (not using ascii)
    data: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";

    receive() {
        // do nothing with it, just test compilation
    }
}
