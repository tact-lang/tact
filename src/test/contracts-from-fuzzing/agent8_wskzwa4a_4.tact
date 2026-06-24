struct Point { x: Int; y: Int; }

struct PopQuiz { vogonsCount: Int; nicestNumber: Int; }

struct Line { start: Point; end: Point; }

struct Params { name: String = "default"; age: Int?; }

struct Mad { ness: Bool; }

struct Example { number: Int; }

struct Example2 { field: Int; }

struct Two { first: Int; second: String; }

struct Inner { num: Int; }

struct Outer { inner: Inner; }

struct TestComma { a: Int; b: Int; }

struct InnerDefault { value: Int; }

struct OuterDefault { inner: InnerDefault = InnerDefault { value: 99 }; }

struct NoSemicolon { value: Int }

struct Complex { p: Point; l: Line; pop: PopQuiz; }

fun test1(): Int {
    let p = Point { x: 10, y: 20 };
    return p.x + p.y;
}

fun test2(): Int {
    let vogonsCount: Int = 7;
    let nicestNumber: Int = 42;
    let pq1 = PopQuiz { vogonsCount: vogonsCount, nicestNumber: nicestNumber };
    let pq2 = PopQuiz { vogonsCount, nicestNumber, };
    return pq1.vogonsCount + pq1.nicestNumber + pq2.vogonsCount + pq2.nicestNumber;
}

fun test3(): Int {
    let l = Line { start: Point { x: 5, y: 5 }, end: Point { x: 10, y: 10 } };
    return l.start.x + l.end.x;
}

fun test4(): String {
    let p = Params { age: 30 };
    return p.name;
}

fun test5(): Bool {
    return Mad { ness: true }.ness;
}

fun testDestructuring(): Int {
    let Example { number } = Example { number: 50 };
    return number;
}

fun testDestructuringRenaming(): Int {
    let s = Example2 { field: 100 };
    let Example2 { field: varFromField } = s;
    return varFromField;
}

fun testCellConversion(): Int {
    let p = Point { x: 3, y: 7 };
    let cell = p.toCell();
    let p2 = Point.fromCell(cell);
    return p2.x + p2.y;
}

fun testSliceConversion(): Int {
    let p = Point { x: 8, y: 2 };
    let slice = p.toCell().asSlice();
    let p2 = Point.fromSlice(slice);
    return p2.x - p2.y;
}

fun testOrdering(): Int {
    let t = Two { first: 42, second: "hello" };
    let Two { second, first } = t;
    return first;
}

fun testWildcard(): Int {
    let t = Two { first: 15, second: "ignored" };
    let Two { first: a, second: _ } = t;
    return a;
}

fun testNestedDestructuring(): Int {
    let o = Outer { inner: Inner { num: 5 } };
    let Outer { inner } = o;
    let Inner { num } = inner;
    return num;
}

fun testTrailingComma(): Int {
    let tc = TestComma { a: 10, b: 20, };
    return tc.a + tc.b;
}

fun testDefaultNested(): Int {
    let o = OuterDefault {};
    return o.inner.value;
}

fun testDefaultValueOverride(): String {
    let p = Params { name: "override", age: 100 };
    return p.name;
}

fun testNoSemicolon(): Int {
    return NoSemicolon { value: 123 }.value;
}

fun testComplex(): Int {
    let c = Complex { 
        p: Point { x: 1, y: 2 }, 
        l: Line { start: Point { x: 3, y: 3 }, end: Point { x: 6, y: 6 } }, 
        pop: PopQuiz { vogonsCount: 10, nicestNumber: 20 } 
    };
    return c.p.x + c.l.end.x + c.pop.nicestNumber;
}
