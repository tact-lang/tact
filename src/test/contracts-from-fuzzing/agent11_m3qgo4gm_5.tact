struct Point {
    x: Int;
    y: Int;
}

struct Person {
    name: String = "Alice";
    age: Int?; // optional; defaults to null
}

struct Data {
    a: Int;
    b: Int;
}

struct Order {
    first: Int;
    second: Int;
}

struct S {
    x: Int;
}

struct OptionalStruct {
    flag: Bool;
    note: String?;
}

struct NoSemi { a: Bool }  // semicolon is optional

// Valid tests covering documented features:
// 1. Default field values
fun testDefault(): String {
    let p: Person = Person {  };
    return p.name; // should be "Alice"
}

// 2. Field punning: when variable names match field names
fun testPunning(): Int {
    let x: Int = 7;
    let y: Int = 12;
    let p: Point = Point { x, y };
    return p.x * 10 + p.y; // expecting 7*10 + 12 = 82
}

// 3. Conversion laws: toCell and fromCell round-trip
fun testConversion(): Int {
    let d: Data = Data { a: 10, b: 20 };
    let cell = d.toCell();
    let d2 = Data.fromCell(cell);
    return d2.a + d2.b; // expecting 30
}

// 4. Nested struct instantiation
fun testNested(): Int {
    let p: Point = Point { x: 3, y: 4 };
    return p.x + p.y; // expecting 7
}

// 5. Optional field instantiation with provided value
fun testOptional(): String? {
    let os: OptionalStruct = OptionalStruct { flag: true, note: "present" };
    return os.note;
}

// 6. Struct declaration without trailing semicolon
fun testNoSemi(): Bool {
    let ns: NoSemi = NoSemi { a: true };
    return ns.a;
}

// 7. Field ordering in instantiation (order in braces can be arbitrary)
fun testOrder(): Int {
    let o: Order = Order { second: 5, first: 3 };
    return o.first * 10 + o.second; // expecting 35
}

// 8. Conversion using fromSlice
fun testFromSlice(): Int {
    let s: S = S { x: 99 };
    let slice = s.toCell().asSlice();
    let s2 = S.fromSlice(slice);
    return s2.x; // expecting 99
}

// Main function calling all valid tests
fun main() {
    let _ = testDefault();
    let _ = testPunning();
    let _ = testConversion();
    let _ = testNested();
    let _ = testOptional();
    let _ = testNoSemi();
    let _ = testOrder();
    let _ = testFromSlice();
}
