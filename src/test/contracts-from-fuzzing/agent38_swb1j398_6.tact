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
        // Convert cell to slice and load 32 bits (as an arbitrary test)
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

    // Test maps: mapping Int to Int (allowed type)
    fun test_maps() {
        let m: map<Int, Int> = emptyMap();
        m.set(1, 100);
        let value: Int = m.get(1)!!;
        dump(value); // should dump 100
    }

    // Minimal receive function to trigger tests
    receive() {
        self.test_primitives();
        self.test_optionals();
        self.test_struct();
        self.test_maps();
        cashback(sender());
    }
}
