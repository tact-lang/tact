contract TestForeachWildcards2 {
    receive() {
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 25);
        quartiles.set(2, 50);
        quartiles.set(3, 75);

        // Discard both key and value using wildcards
        foreach (_, _ in quartiles) {
            // no operation
        }
    }
}
