contract Test {
    receive() {
        // Valid usage: wildcard in foreach destructuring assignment
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 10);
        quartiles.set(2, 20);
        foreach (_, _ in quartiles) {
            // both key and value discarded
        }
    }
}
