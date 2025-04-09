struct One { number: Int; }

struct Params {
    name: String = "Satoshi"; // default value
    age: Int?; // optional field, defaults to null
    val: One;
}

contract TestStructs() {
    fun test() {
        // Create a simple struct instance
        let s1: One = One{ number: 50 };
        dump(s1.number); // Expected: 50

        // Instantiate Params using field punning; age defaults to null
        let p: Params = Params{ val: s1 };
        dump(p.name); // Expected: "Satoshi"
        // Check optional field
        if (p.age == null) {
            dump(0);
        } else {
            dump(1);
        }

        // Test conversion: struct -> cell -> struct
        let cell = s1.toCell();
        let s2 = One.fromCell(cell);
        dump(s2.number); // Expected: 50
    }
    receive() { self.test(); }
}
