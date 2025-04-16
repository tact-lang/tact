struct BigNested {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: Cell?;
}

struct WrapBigNested {
    nested: BigNested;
}

contract BigNestedContract {
    s: WrapBigNested;

    init() {
        self.s = WrapBigNested{
            nested: BigNested{
                a: 1, b: true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(), f: "x",
                g: null, h: null, i: null, j: null
            }
        };
    }
}