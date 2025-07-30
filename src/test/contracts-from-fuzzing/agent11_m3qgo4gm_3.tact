struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

struct Params {
    name: String = "Default"; // default field
    age: Int?;              // optional field, defaults to null
    pt: Point;
}

struct NoSemi { a: Bool }  // semicolon is optional

struct Pun {
    x: Int;
    y: Int;
}

struct TestStruct {
    a: Int;
    b: Int;
}

fun testStructs() {
    // Instantiate a simple struct and access its fields
    let p: Point = Point { x: 3, y: 4 };
    let sum: Int = p.x + p.y; // should be 7
    
    // Instantiate a nested struct
    let l: Line = Line { start: p, end: Point { x: 10, y: 20 } };

    // Instantiate a struct with default and optional fields
    let par: Params = Params { pt: p };

    // Test field punning (using variable names identical to field names)
    let x: Int = 5;
    let y: Int = 15;
    let pun: Pun = Pun { x, y };

    // Test conversion laws: convert to a Cell and back
    let ts: TestStruct = TestStruct { a: 7, b: 8 };
    let cell = ts.toCell();
    let ts2 = TestStruct.fromCell(cell);
    let diff = (ts.a - ts2.a) + (ts.b - ts2.b);

    // Instantiate struct defined without a trailing semicolon
    let ns: NoSemi = NoSemi { a: true };
}

fun main() {
    testStructs();
}
