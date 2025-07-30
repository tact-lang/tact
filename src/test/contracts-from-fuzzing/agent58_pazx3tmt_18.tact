contract Test {
    receive() {
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 25);
        quartiles.set(2, 50);
        quartiles.set(3, 75);

        // Correct syntax for discarding both key and value in a foreach loop
        foreach (_, _ in quartiles) {
            dump(10);
        }
    }
}
