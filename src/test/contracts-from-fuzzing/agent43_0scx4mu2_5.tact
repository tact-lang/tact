// TestStructs: Testing structs, default fields, optional fields, and conversion to/from Cell
struct One { number: Int; }

struct Params {
    name: String = "Satoshi"; // default value
    age: Int?;                // optional field, defaults to null
    val: One;
}

contract TestStructs {
    fun test() {
        let s: One = One{ number: 50 };
        let p = Params{ val: s };
        // p.name should be "Satoshi" by default
        dump(p.name); // Expect: "Satoshi"
        // p.age should be null by default
        if (p.age == null) { dump(1); } else { dump(0); }  
        // Convert struct to Cell and back
        let cell = s.toCell();
        let s2 = One.fromCell(cell);
        dump(s2.number); // Expect: 50
        return;
    }

    receive() {
        self.test();
    }
}
