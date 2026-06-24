struct MyStruct { x: Int; y: Bool; }

// Define a message struct with a 32-bit opcode (using an arbitrary opcode, e.g., 1234)
message(1234) MyMsg { someVal: Int as uint8; }

// Test primitives: Int, Bool, String, Cell
fun test_Primitives() {
    let a: Int = 1 + 1;          // expected: 2
    dump(a);
    let b: Bool = true && false; // expected: false
    dump(b);
    let c: String = "hello";     // expected: "hello"
    dump(c);
    let d: Cell = "hello".asComment(); // create a cell from a string
    dump(d);
}

// Test optionals: assignment and non-null assertion
fun test_Optionals() {
    let opt: Int? = null; // initially null
    opt = 42;
    dump(opt!!); // should dump 42
}

// Test maps: basic operations
fun test_Maps() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    dump(m.get(1)!!); // should dump 100
}

// Test structs: construction and field access
fun test_Structs() {
    let s: MyStruct = MyStruct{ x: 10, y: true };
    dump(s.x); // should dump 10
}

// Test message structs: construction and field access
fun test_Messages() {
    let m: MyMsg = MyMsg{ someVal: 42 };
    dump(m.someVal); // should dump 42
}

// Main entry point
fun main() {
    test_Primitives();
    test_Optionals();
    test_Maps();
    test_Structs();
    test_Messages();
}
