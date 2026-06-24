struct Point { x: Int; y: Int; }

struct Line { start: Point; end: Point; }

struct Params {
    name: String = "Satoshi";
    age: Int?;
    point: Point;
}

// Semicolon is optional after a struct declaration
struct Mad { ness: Bool }

struct ArbitraryStruct { val: Int as uint32 }

struct OptionalTest { a: Int? }

struct Reorder { a: Int; b: Int; }

struct FieldPunning { x: Int; y: Int; }

struct Movie { title: String; rating: Int?; }

fun test_basic() : Int {
    let p: Point = Point { x: 10, y: 20 };
    return p.y; // expect 20
}

fun test_default() : String {
    let p: Params = Params { point: Point { x: 1, y: 2 } };
    return p.name; // expect "Satoshi"
}

fun test_nested() : Int {
    let l: Line = Line { start: Point { x: 5, y: 5 }, end: Point { x: 15, y: 15 } };
    return l.end.x; // expect 15
}

fun test_no_semicolon() : Bool {
    let m: Mad = Mad { ness: true };
    return m.ness; // expect true
}

fun convert_test() : Int {
    let inst: ArbitraryStruct = ArbitraryStruct { val: 42 };
    let cell = inst.toCell();
    let inst2 = ArbitraryStruct.fromCell(cell);
    return inst2.val; // expect 42
}

fun return_struct() : Point {
    return Point { x: 7, y: 8 };
}

fun test_optional() : Int {
    let o: OptionalTest = OptionalTest { };
    return (o.a == null) ? 1 : 2; // expect 1 since a is null by default
}

fun test_reorder() : Int {
    let r: Reorder = Reorder { b: 100, a: 50 };
    return r.a + r.b; // expect 150
}

fun test_punning() : Int {
    let x = 30;
    let y = 70;
    // Using field punning syntax
    return FieldPunning { x, y }.x + FieldPunning { x, y }.y; // (30+70)+(30+70) = 200
}

fun test_optional_val() : Int {
    let o: OptionalTest = OptionalTest { a: 123 };
    return o.a!!; // force unwrap, expect 123
}

fun test_movie() : String {
    let m: Movie = Movie { title: "Inception", rating: 9 };
    return m.title; // expect "Inception"
}

fun main() : Int {
    let a = test_basic();      // 20
    let b = test_nested();     // 15
    let c = convert_test();    // 42
    let d = test_optional();   // 1
    let e = test_reorder();    // 150
    let f = test_punning();    // 200
    let g = test_optional_val(); // 123
    // Also calling test_default and test_movie to ensure they compile
    let _ = test_default();
    let _ = test_movie();
    return a + b + c + d + e + f + g; // expected total: 551
}
