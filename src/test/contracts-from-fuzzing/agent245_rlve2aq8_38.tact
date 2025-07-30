struct LargeNestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: InnerNested;
}

struct InnerNested {
    x: Int;
    y: Bool;
}

contract BigNestedStructTest {
    s: LargeNestedStruct;

    init() {
        self.s = LargeNestedStruct{
            a: 1, b: true, c: "ok", d: emptyCell().asSlice(), e: emptyCell(),
            f: InnerNested{ x: 10, y: false }
        };
    }
}