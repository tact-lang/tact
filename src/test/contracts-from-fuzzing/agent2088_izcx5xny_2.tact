struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    inner: Inner;
    c: String;
    d: Int?;
}

struct Outer {
    mid: Middle;
    e: Cell;
    f: Bool?;
    g: Address;
}

contract NestedStructsTest {
    obj: Outer;

    init() {
        self.obj = Outer{
            mid: Middle{
                inner: Inner{ a: 10, b: true },
                c: "nested",
                d: null
            },
            e: emptyCell(),
            f: false,
            g: myAddress()
        };
    }
}