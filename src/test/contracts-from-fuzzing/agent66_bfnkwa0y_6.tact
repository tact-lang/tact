// Test 5: Map Usage with Int Keys
// This test validates basic operations on maps with Int keys to Int values.

contract TestMapUsage {
    fun run() {
        let m: map<Int, Int> = emptyMap();
        m.set(10, 420);
        let x: Int = m.get(10)!!;
        dump(x); // Expected output: 420
    }
}
