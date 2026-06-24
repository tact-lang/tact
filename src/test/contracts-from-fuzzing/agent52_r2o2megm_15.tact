// Scenario J: Using wildcard to discard keys in foreach iteration

contract IterationDiscardKey {
    receive() {
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 25);
        quartiles.set(2, 50);
        quartiles.set(3, 75);
        // Discard key, only use value
        foreach (_, v in quartiles) {
            dump(v);
        }
    }
}
