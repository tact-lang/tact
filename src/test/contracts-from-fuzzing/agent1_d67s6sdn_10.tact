//// Comprehensive Fuzz-Testing Cycle for Structs Feature

// Test 1: Basic struct instantiation and field access
struct Basic {
    a: Int;
    b: Int;
}

fun test_basic() : Int {
    let s = Basic{ a: 1, b: 2 };
    return s.a + s.b; // Expected: 3
}

//// Test 2: Struct with defaults and required field
struct Defaults {
    a: Int = 10;
    b: Int = 20;
    c: Int;  // no default
}

fun test_defaults() : Int {
    let d = Defaults{ c: 30 };
    return d.a + d.b + d.c; // Expected: 10+20+30 = 60
}

//// Test 3: Field Punning
struct PopQuiz {
    vogonsCount: Int;
    nicestNumber: Int;
}

fun test_punning() : Int {
    let vogonsCount: Int = 42;
    let nicestNumber: Int = 69;
    // Using field punning with trailing comma
    let p = PopQuiz{ vogonsCount, nicestNumber, };
    return p.vogonsCount + p.nicestNumber; // Expected: 111
}

//// Test 4: Nested Structs and default field in nested struct
struct Point {
    x: Int;
    y: Int;
}

struct Params {
    name: String = "Satoshi";
    age: Int?; // optional (default null)
    point: Point;
}

fun test_nested() : String {
    let p = Params{ point: Point{ x: 5, y: 7 } };
    return p.name; // Expected: "Satoshi"
}

//// Test 5: Omitting the last semicolon in struct declaration (allowed behavior)
struct NoSemi { a: Int; b: Int }

fun test_no_semi() : Int {
    let ns = NoSemi{ a: 10, b: 20 };
    return ns.a + ns.b; // Expected: 30
}

//// Test 6: Circular Structs (should trigger error)
// The following code is expected to fail compilation because circular types are forbidden:
// struct A { b: B; }
// struct B { a: A; }
// fun test_circular() : Int { return 0; }

//// Test 7: Missing required field (should trigger error)
// struct Missing { a: Int; b: Int; }
// fun test_missing() : Int { let m = Missing{ a: 10 }; return m.a; }

//// Test 8: Empty Struct (should trigger error)
// struct Empty {}
// fun test_empty() : Int { let e = Empty{}; return 0; }

//// Test 9: Conversion laws using .toCell() and .fromCell()/fromSlice()
struct C {
    x: Int;
    y: Int;
}

fun test_conversion() : Int {
    let original = C { x: 7, y: 8 };
    let cell = original.toCell();
    let slice = cell.asSlice();
    let fromCell = C.fromCell(cell);
    let fromSlice = C.fromSlice(slice);
    // Expected: (7+8) + (7+8) = 30
    return fromCell.x + fromCell.y + fromSlice.x + fromSlice.y;
}

//// Test 10: Optional field default (should be null when not provided)
struct OptionTest {
    a: Int?;
}

fun test_optional() : Int {
    let o = OptionTest{}; // a is implicitly null
    if (o.a == null) {
        return 1; // Expected: 1 if null
    } else {
        return 0;
    }
}

//// Test 11: Default override check
struct DefaultOverride {
    x: Int = 5;
}

fun test_override() : Int {
    let a = DefaultOverride{};
    return a.x; // Expected: 5
}

//// Test 12: Message as Struct conversion
message Ping {
    value: Int;
}

fun test_message() : Int {
    let m = Ping{ value: 7 };
    let cell = m.toCell();
    let m2 = Ping.fromCell(cell);
    return m2.value; // Expected: 7
}

//// Test 13: Field casting with "as" annotation
struct CastTest {
    x: Int as uint8;
}

fun test_cast() : Int {
    let ct = CastTest{ x: 100 };
    return ct.x; // Expected: 100
}

//// Test 14: Field order independence at instantiation
struct Reordered {
    a: Int;
    b: Int;
}

fun test_reordered() : Int {
    let r = Reordered{ b: 3, a: 2 };
    return r.a * 10 + r.b; // Expected: 2*10+3 = 23
}

//// Test 15: Using Slice type in a struct
struct Data {
    payload: Slice;
}

fun test_slice() : Int {
    let d = Data{ payload: emptySlice() };
    return 0;
}

// End of fuzz-testing cycle for structs
