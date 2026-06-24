struct MixAll {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Slice;
    j: Slice?;
    k: Cell;
    l: Cell?;
}

contract MixAllTest {
    mp: MixAll;

    init() {
        self.mp = MixAll {
            a: 1,
            b: null,
            c: true,
            d: null,
            e: "hello",
            f: null,
            g: myAddress(),
            h: null,
            i: emptyCell().asSlice(),
            j: null,
            k: emptyCell(),
            l: null
        };
    }
}
