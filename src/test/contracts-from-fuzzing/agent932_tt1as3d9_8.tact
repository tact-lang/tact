struct InnerMost {
    x: Int;
    y: Bool;
    z: String;
    c: Cell;
    s: Slice;
    a: Address;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract MixedNestedPrimitives {
    data: Outer;

    init() {
        self.data = Outer{
            mid: Middle{
                inner: InnerMost{
                    x: 1,
                    y: false,
                    z: "ok",
                    c: emptyCell(),
                    s: emptyCell().asSlice(),
                    a: myAddress(),
                },
            },
        };
    }
}