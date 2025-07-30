struct BigNested {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Bool?;
    g: Int?;
    h: String?;
    i: Address?;
    j: Cell?;
}

contract NestedFields {
    big: BigNested;

    init() {
        self.big = BigNested{
            a: 1, b: true, c: "hi", d: myAddress(), e: emptyCell(),
            f: false, g: null, h: null, i: null, j: null
        };
    }
}