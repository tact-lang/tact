struct BigMix {
    a: Int;
    b: Bool;
    c: Address?;
    d: String?;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: Address?;
    j: String?;
    k: Cell;
    l: Slice;
}

contract TestContract {
    data: BigMix;

    init() {
        self.data = BigMix{
            a: 1,
            b: true,
            c: null,
            d: null,
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: null,
            h: null,
            i: null,
            j: null,
            k: emptyCell(),
            l: emptyCell().asSlice(),
        };
    }

    receive() {
        dump(self.data.a);
    }
}