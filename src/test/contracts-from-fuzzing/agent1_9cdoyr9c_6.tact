/// Comprehensive Type System Fuzz Test
/// This snippet tests various type aspects in Tact including primitive types, optionals, maps, structs, message structs, and extension functions.

// A simple struct for testing
struct MyStruct { x: Int; y: Bool; }

// A message struct with a 32-bit opcode
message(1234) MyMsg { someVal: Int as uint8; }

// Extension function for Int to double its value
extends fun double(self: Int): Int {
    return self + self;
}

// Test primitive types: Int, Bool, String, Cell
fun test_Primitives() {
    let a: Int = 1 + 1;           // Expected: 2
    dump(a);
    let b: Bool = true && false;  // Expected: false
    dump(b);
    let c: String = "hello";      // Expected: "hello"
    dump(c);
    let d: Cell = "hello".asComment(); // Create a cell from a string
    dump(d);
}

// Test optionals: assignment and non-null assertion
fun test_Optionals() {
    let opt: Int? = null; // Initially null
    opt = 42;
    dump(opt!!); // Expected to dump 42
}

// Test maps: basic operations
fun test_Maps() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    dump(m.get(1)!!); // Expected to dump 100
}

// Test structs: construction and field access
fun test_Structs() {
    let s: MyStruct = MyStruct{ x: 10, y: true };
    dump(s.x); // Expected to dump 10
    dump(s.y); // Expected to dump true
}

// Test message structs: construction and field access
fun test_Messages() {
    let msg: MyMsg = MyMsg{ someVal: 42 };
    dump(msg.someVal); // Expected to dump 42
}

// Test extension function: doubling an Int
fun test_Extension() {
    let x = 10;
    let y = x.double(); // Expected to dump 20
    dump(y);
}

fun main() {
    test_Primitives();
    test_Optionals();
    test_Maps();
    test_Structs();
    test_Messages();
    test_Extension();
}
