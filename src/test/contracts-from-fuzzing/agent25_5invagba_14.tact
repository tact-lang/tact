contract TestChaining {
    receive() {
        // Chaining extension function calls on literals
        dump(42.toString());
        dump("Tact is awesome!".asComment());
    }
}
