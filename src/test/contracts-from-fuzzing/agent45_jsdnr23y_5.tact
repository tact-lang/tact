// Test Suite: Valid Type System Interactions
// This snippet tests primitives, optionals (valid usage), structs, messages, and maps.

struct One { number: Int; }
message MyMsg { x: Int as uint8; }

contract TestTypeValid {
    fun test() {
        // Test 1: Primitive types
        let a: Int = 1 + 2;
        dump(a); // Expect: 3

        let b: Bool = true && false;
        dump(b); // Expect: false

        let s: String = "Hello, Tact";
        dump(s); // Expect: "Hello, Tact"

        // Test Cell: Use asSlice() to check the number of bits (empty cell)
        let c: Cell = emptyCell();
        let sl: Slice = c.asSlice();
        dump(sl.bits()); // Expect: 0 (empty cell has 0 bits)

        // Test 2: Valid Optionals
        let opt: Int? = null;
        opt = 10;
        dump(opt!!); // Expect: 10

        // Test 4: Structs roundtrip
        let o: One = One{ number: 50 };
        let cellO: Cell = o.toCell();
        let o2: One = One.fromCell(cellO);
        dump(o2.number); // Expect: 50

        // Test 5: Message struct usage
        let msg: MyMsg = MyMsg{ x: 42 };
        let cellMsg: Cell = msg.toCell();
        let slMsg: Slice = cellMsg.asSlice();
        dump(slMsg.bits()); // Dump bit count of serialized message

        // Test 6: Maps usage
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        m.set(1, 200);
        let v: Int = m.get(1)!!;
        dump(v); // Expect: 200

        let delSuccess: Bool = m.del(1);
        dump(delSuccess); // Expect: true

        let exists: Bool = m.exists(1);
        dump(exists); // Expect: false
    }
    receive() { self.test(); }
}
