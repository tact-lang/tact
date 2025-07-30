contract Test {
    // Getter declared but never used
    get fun unusedGetter(): Int {
         return 1;
    }

    receive() {}
}
