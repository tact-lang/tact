struct One { number: Int; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    val: One;
}

// Test Structs: instantiation, default fields, and conversion
contract TestStructs() {
    fun test() {
        let s: One = One{ number: 50 };
        dump(s.number);            // expected output: 50
        let p: Params = Params{ val: s };
        dump(p.name);              // expected output: "Satoshi"
        dump(p.age == null ? 0 : 1); // expected output: 0 (false)
        dump(p.val.number);        // expected output: 50
        
        // Convert struct to Cell and back
        let cell: Cell = s.toCell();
        let s2: One = One.fromCell(cell);
        dump(s2.number);           // expected output: 50
    }
    receive() { self.test(); }
}
