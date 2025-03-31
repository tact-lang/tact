struct Point {
    x: Int;
    y: Int;
}

fun testPoint(): Int {
    let p: Point = Point{ x: 3, y: 4 };
    return p.x * p.y;
}

struct Data {
    a: Int;
    b: Int;
}

fun testFieldPunning(): Int {
    let a: Int = 10;
    let b: Int = 20;
    let d: Data = Data{ a, b };
    return d.a + d.b;
}

struct Defaults {
    name: String = "Test";
    value: Int = 42;
}

fun testDefaults(): String {
    let d: Defaults = Defaults{};
    return d.name;
}

struct OptionalTest {
    maybe: Int?;
}

fun testOptionals2(): Int {
    let o: OptionalTest = OptionalTest{};
    if (o.maybe != null) {
         return o.maybe!!; // non-null assertion
    } else {
         return 99;
    }
}

struct MixedDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int;
}

fun testMixed(): Int {
    let m: MixedDefaults = MixedDefaults{ c: 10, a: 5 };
    return m.a + m.b + m.c;
}

struct Line {
    start: Point;
    end: Point;
}

fun testNested(): Int {
    let ln: Line = Line{ start: Point{ x: 1, y: 2 }, end: Point{ x: 3, y: 4 } };
    return (ln.end.x - ln.start.x) + (ln.end.y - ln.start.y);
}

struct Convert {
    x: Int;
    y: Int;
}

fun testConversion(): Int {
    let orig: Convert = Convert{ x: 7, y: 8 };
    let cell = orig.toCell();
    let conv = Convert.fromCell(cell);
    return conv.x * conv.y;
}

struct NoSemicolon { flag: Bool }

fun testNoSemicolon(): Bool {
    let ns: NoSemicolon = NoSemicolon{ flag: true };
    return ns.flag;
}

struct AliasTest {
    num: Int as uint8;
}

fun testAlias(): Int {
    let a: AliasTest = AliasTest{ num: 255 };
    return a.num;
}

struct Order {
    a: Int;
    b: Int;
}

fun testOrder(): Int {
    let o1: Order = Order{ a: 10, b: 20 };
    let o2: Order = Order{ b: 20, a: 10 };
    return o1.a + o2.b;
}

struct Inner {
    x: Int = 5;
}

struct Outer {
    inner: Inner;
    tag: String = "outer";
}

fun testNestedDefault(): Int {
    let o: Outer = Outer{ inner: Inner{} };
    return o.inner.x;
}

struct A {
    x: Int;
}

struct B {
    inner: A;
}

fun testNestedConversion(): Int {
    let b1: B = B{ inner: A{ x: 99 } };
    let cell = b1.toCell();
    let b2: B = B.fromCell(cell);
    return b2.inner.x;
}

struct Complex {
    a: Int = 1;
    b: Int?;
    c: String = "hello";
}

fun testComplex(): String {
    let cplx: Complex = Complex{};
    if (cplx.b == null) {
        return cplx.c;
    } else {
        return "bad";
    }
}
