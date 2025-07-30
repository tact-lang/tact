struct LongList {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Bool?;
    h: Int?;
    i: Address?;
    j: Slice?;
    k: String;
}

contract TestContract {
    val: LongList;

    init() {
        self.val = LongList{
            a: 1,
            b: true,
            c: "x",
            d: myAddress(),
            e: emptyCell().asSlice(),
            f: emptyCell(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: "y",
        };
    }
}