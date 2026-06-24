struct BigStructOpt {
    a: Int;
    b: Bool;
    c: Address?;
    d: Cell;
    e: Slice;
    f: String;
    g: Int;
    h: Bool;
    i: Address?;
    j: Cell;
    k: Slice;
    l: String;
}

contract BigStructOptField {
    big: BigStructOpt;

    init() {
        self.big = BigStructOpt{
            a: 1,
            b: true,
            c: null,
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "a",
            g: 2,
            h: false,
            i: null,
            j: emptyCell(),
            k: emptyCell().asSlice(),
            l: "b",
        };
    }
}