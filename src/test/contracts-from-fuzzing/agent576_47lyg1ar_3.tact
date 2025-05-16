struct LongList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Bool?;
    i: Int?;
    j: Address?;
    k: String?;
}

contract TestContract {
    big: LongList;
    init() {
        self.big = LongList{
            a: 42,
            b: true,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
            h: null,
            i: null,
            j: null,
            k: null
        };
    }
}