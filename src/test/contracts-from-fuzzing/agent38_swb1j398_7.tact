extends fun inc(self: Int): Int {
    return self + 1;
}

message MyMsg {
    someVal: Int as uint8;
}

struct Dummy {
    x: Int;
    y: Bool;
}

contract FuzzTests {
    // Test primitives: Int, Bool, String, Cell
    fun test_primitives() {
        let a: Int = 1 + 1; // expected 2
        let b: Bool = true && false; // expected false
        let s: String = "Hello, TON!";
        let c: Cell = s.asComment();
        dump(a);      // should dump 2
        dump(b);      // should dump false
        dump(s);      // should dump "Hello, TON!"
        // Convert cell to slice and load an arbitrary 32-bit uint
        dump(c.asSlice().loadUint(32));
    }

    // Test optionals
    fun test_optionals() {
        let opt: Int? = null;
        opt = 42;
        dump(opt!!); // should dump 42
        if (opt != null) {
            dump(1);
        } else {
            dump(0);
        }
    }

    // Test struct serialization and deserialization
    fun test_struct() {
        let d: Dummy = Dummy{ x: 100, y: true };
        let cell = d.toCell();
        let d2: Dummy = Dummy.fromCell(cell);
        dump(d2.x); // should dump 100
        dump(d2.y); // should dump true
    }

    // Test maps: mapping Int to Int
    fun test_maps_int() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let value: Int = m.get(1)!!;
        dump(value); // should dump 100
    }

    // Test maps with Address keys: mapping Address to Int
    fun test_maps_address() {
        let m: map<Address, Int> = emptyMap();
        m.set(myAddress(), 999);
        let value: Int = m.get(myAddress())!!;
        dump(value); // should dump 999
    }

    // Test extension function on Int using the custom 'inc' extension
    fun test_extension() {
        let x: Int = 5.inc();
        dump(x); // should dump 6
    }

    // Test message struct conversion
    fun test_message() {
        let m: MyMsg = MyMsg{ someVal: 42 };
        let cell = m.toCell();
        let m2: MyMsg = MyMsg.fromCell(cell);
        dump(m2.someVal); // should dump 42
    }

    // Minimal receive function to trigger all tests
    receive() {
        self.test_primitives();
        self.test_optionals();
        self.test_struct();
        self.test_maps_int();
        self.test_maps_address();
        self.test_extension();
        self.test_message();
        cashback(sender());
    }
}
