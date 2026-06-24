// TestStructs.tact

// Testing struct instantiation, conversion to Cell and back

struct One { number: Int; }

struct Params {
    name: String = "default";
    age: Int?; // defaults to null
    val: One;
}

contract TestStructs() {
    fun test() {
        // Instantiate a simple struct
        let a: One = One{ number: 50 };
        dump(a.number); // Expected: 50

        // Instantiate Params struct using field punning; age is null by default
        let p: Params = Params{ val: a };
        dump(p.name);  // Expected: "default"
        // Check optional field; p.age is null
        if (p.age == null) {
             dump(0);
        } else {
             dump(p.age!!);
        }

        // Convert struct One to Cell and back
        let cell = a.toCell();
        let a2 = One.fromCell(cell);
        dump(a2.number); // Expected: 50
    }
    
    receive() { self.test(); }
}
