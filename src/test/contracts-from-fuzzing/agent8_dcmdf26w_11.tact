///////////////////////////////
// Test 11: Valid usage – Using wildcards in foreach loop to discard keys
// Expected: Compiles successfully

contract Test {
    receive() {
        let quartiles: map<Int, Int> = emptyMap();
        quartiles.set(1, 25);
        quartiles.set(2, 50);
        quartiles.set(3, 75);
        quartiles.set(4, 100);

        foreach (_, value in quartiles) {
            // Here '_' properly discards the key, and 'value' is used
            dump(value);
        }
    }
}
