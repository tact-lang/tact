/// Comprehensive Fuzz Test for Tact Type System
/// This snippet tests various aspects of Tact's type system including:
/// - Primitive types (Int, Bool, String, Cell)
/// - Optionals and non-null assertions
/// - Map operations and map-to-cell conversion
/// - Structs and their field access
/// - Message structs and their initialization
/// - Extension functions for primitives
/// - Address conversion and StdAddress parsing
/// - Use of native function ton() for coins


// A simple struct for testing
struct MyStruct { x: Int; y: Bool; }

// A message struct with a 32-bit opcode
message(1234) MyMsg { someVal: Int as uint8; }

// Extension function for Int to double its value
extends fun double(self: Int): Int {
    return self + self;
}

// Test function for primitive types: Int, Bool, String, Cell
fun test_Primitives() {
    let a: Int = 1 + 1;           // Expected: 2
    dump(a);
    let b: Bool = true && false;  // Expected: false
    dump(b);
    let c: String = "hello";      // Expected: "hello"
    dump(c);
    let d: Cell = "hello".asComment(); // Create a cell from string
    dump(d);
}

// Test function for optionals and non-null assertions
fun test_Optionals() {
    let opt: Int? = null; // Initially null
    opt = 42;
    dump(opt!!); // Expected: 42
}

// Test function for maps: basic operations and conversion to Cell
fun test_Maps() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    dump(m.get(1)!!); // Expected: 100
    dump(m.asCell());  // Dump underlying Cell representation
}

// Test function for structs: construction and field access
fun test_Structs() {
    let s: MyStruct = MyStruct{ x: 10, y: true };
    dump(s.x); // Expected: 10
    dump(s.y); // Expected: true
}

// Test function for message structs: construction and field access
fun test_Messages() {
    let msg: MyMsg = MyMsg{ someVal: 42 };
    dump(msg.someVal); // Expected: 42
}

// Test function for extension functions on Int
fun test_Extension() {
    let x = 10;
    let y = x.double(); // Expected: 20
    dump(y);
}

// Test function for address conversion and StdAddress parsing
fun test_Addresses() {
    let addr: Address = myAddress(); // gets the current contract address
    let std: StdAddress = parseStdAddress(addr.asSlice());
    dump(std.workchain); // Expected: workchain number (commonly 0)
    dump(std.address);   // Expected: account id
}

// Test function for native coins conversion using ton()
fun test_Ton() {
    let coin: Int = ton("1"); // 1 Toncoin as 10^9 nanoToncoin
    dump(coin);
}

// Main entry point calling all tests
fun main() {
    test_Primitives();
    test_Optionals();
    test_Maps();
    test_Structs();
    test_Messages();
    test_Extension();
    test_Addresses();
    test_Ton();
}
