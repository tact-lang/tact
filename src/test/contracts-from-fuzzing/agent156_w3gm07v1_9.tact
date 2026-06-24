struct LargeNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Bool;
    h: Int;
    i: Bool;
    j: String;
    k: Address;
    l: Slice;
    m: Cell;
}

struct HasLargeNested {
    nested: LargeNested;
    extra: Int;
}

contract ComplexNested {
    state: HasLargeNested;

    init() {
        self.state = HasLargeNested{
            nested: LargeNested{
                a: 1, b: true, c: "one", d: myAddress(),
                e: emptyCell().asSlice(), f: emptyCell(),
                g: false, h: 2, i: true, j: "two",
                k: myAddress(), l: emptyCell().asSlice(), m: emptyCell()
            },
            extra: 123
        };
    }
}