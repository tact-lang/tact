///////////////////////////////////////////////////////////////
// Comprehensive tests for Tact 'structs' feature
///////////////////////////////////////////////////////////////

// Test 1: Basic struct instantiation and field access
struct Point {
    x: Int;
    y: Int;
}

fun test_point() : Int {
    let p = Point { x: 5, y: 10 };
    return p.x + p.y; // Expected: 15
}

// Test 2: Default field values in structs
struct Params {
    name: String = "Satoshi";
    age: Int?;   // Optional field with default null
    point: Point;
}

fun test_params() : String {
    let p = Params{ point: Point { x: 3, y: 4 } };
    return p.name; // Expected: "Satoshi"
}

// Test 3: Optional field defaulting to null
struct OptionalTest {
    maybe: Int?;
}

fun test_optional() : Int {
    let o = OptionalTest{};
    return (o.maybe == null) ? 42 : 0; // Expected: 42
}

// Test 4: Field punning in struct instantiation
struct Punned {
    a: Int;
    b: Int;
}

fun test_punned() : Int {
    let a = 7;
    let b = 8;
    // Using field punning syntax
    let p = Punned{ a, b };
    return p.a + p.b; // Expected: 15
}

// Test 5: Struct declaration with omitted semicolon
struct SemicolonOmitted {
    value: Int
}

fun test_omit_semicolon() : Int {
    let s = SemicolonOmitted { value: 10 };
    return s.value; // Expected: 10
}

// Test 6: Nested struct with default field in inner struct
struct Inner {
    x: Int = 2;
    y: Int;
}

struct Outer {
    inner: Inner;
    flag: Bool = true;
}

fun test_nested_default() : Int {
    let o = Outer{ inner: Inner{ y: 5 } };
    // Expected: inner.x (2) + inner.y (5) = 7 if flag is true
    return (o.flag) ? (o.inner.x + o.inner.y) : 0;
}

// Test 7: Reordering fields in instantiation
struct Ordered {
    first: Int;
    second: Int;
    third: Int;
}

fun test_ordered() : Int {
    let o = Ordered{ third: 3, first: 1, second: 2 };
    // Expected: 1*100 + 2*10 + 3 = 123
    return o.first * 100 + o.second * 10 + o.third;
}

// Test 8: Nested struct field punning
struct Nested {
    a: Int;
    b: Int;
}

struct Container {
    nested: Nested;
    c: Int;
}

fun test_nested_punning() : Int {
    let a = 10;
    let b = 20;
    let c = 30;
    let cont = Container{ nested: Nested{ a, b }, c };
    // Expected: 10 + 20 + 30 = 60
    return cont.nested.a + cont.nested.b + cont.c;
}

// Test 9: Conversion between struct and Cell via .toCell() and .fromCell()
struct Conv {
    x: Int;
    y: Int;
}

fun test_conversion() : Int {
    let cell = Conv{ x: 100, y: 150 }.toCell();
    let conv = Conv.fromCell(cell);
    // Expected: 100 + 150 = 250
    return conv.x + conv.y;
}

// Test 10: Nested struct sum
struct Inner2 {
    a: Int;
    b: Int;
}

struct Outer2 {
    inner1: Inner2;
    inner2: Inner2;
}

fun test_nested() : Int {
    let o = Outer2{ inner1: Inner2{ a: 1, b: 2 }, inner2: Inner2{ a: 3, b: 4 } };
    // Expected: 1+2+3+4 = 10
    return o.inner1.a + o.inner1.b + o.inner2.a + o.inner2.b;
}

// Test 11: Custom field serialization with type annotations
struct Custom {
    a: Int as uint8;
    b: Int as coins;
}

fun test_custom() : Int {
    let c = Custom{ a: 42, b: 1000 }.toCell();
    let cc = Custom.fromCell(c);
    // Expected: 42 + 1000 = 1042
    return cc.a + cc.b;
}

// End of comprehensive struct tests
