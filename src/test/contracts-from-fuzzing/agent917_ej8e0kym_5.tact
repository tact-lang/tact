struct Foo {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Bool?;
    g: Int?;
    h: String?;
    i: Cell?;
    j: Slice?;
}

contract Test {
    f: Foo;

    init() {
        self.f = Foo{
            a: 1,
            b: true,
            c: "hi",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: null,
            g: null,
            h: null,
            i: null,
            j: null
        };
    }
}