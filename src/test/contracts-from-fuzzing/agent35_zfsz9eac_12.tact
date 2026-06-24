//// Test 11: Iterating over a map using foreach
contract TestMapForEach {
    // Persistent map from Int to Int
    stateMap: map<Int, Int>;

    init() {
        self.stateMap = emptyMap();
        self.stateMap.set(1, 10);
        self.stateMap.set(2, 20);
        self.stateMap.set(3, 30);
    }

    receive() {
        // Declare a mutable local variable (using assignment as allowed in Tact)
        let sum: Int = 0;
        // Foreach iteration over map entries
        foreach (k, v in self.stateMap) {
            sum = sum + v; // accumulate the sum
        }
        // Expected sum is 60
        dump(sum);
    }
}
