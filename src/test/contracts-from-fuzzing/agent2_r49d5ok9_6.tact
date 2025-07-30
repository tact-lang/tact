contract TestCell {
    // Test dump() with a Cell primitive
    receive() {
        dump(emptyCell());
    }
}
