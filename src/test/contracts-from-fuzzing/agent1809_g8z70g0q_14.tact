struct BigOne {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Builder;
    l: Builder?;
    m: Slice;
    n: Slice?;
}

contract MegaStructHold {
    hold: BigOne;

    init() {
        self.hold = BigOne{
            a: 1, b: true, c: "str", d: null, e: null, f: null,
            g: myAddress(), h: null, i: emptyCell(), j: null,
            k: beginCell(), l: null, m: emptyCell().asSlice(), n: null
        };
    }
}