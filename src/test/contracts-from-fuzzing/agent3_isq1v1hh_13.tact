contract Test {
    receive() {
        // Chained extension calls on literals
        dump(42.toString());
        dump("Tact is awesome!".asComment());
    }
}
