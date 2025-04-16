// Test 4: Struct Usage and Conversion
// This test validates a simple struct instantiation, conversion to Cell and back, and field access.

struct One { number: Int; }

contract TestStructUsage {
    fun run() {
        let o: One = One{ number: 55 };
        let c: Cell = o.toCell();
        let o2: One = One.fromCell(c);
        // Expected dump: 55
        dump(o2.number);
    }
}
