struct Big {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Address;
    f: Address?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: String;
}

contract TestContract {
    big: Big;

    init() {
        self.big = Big{
            a: 42, b: false, c: 123, d: true, e: myAddress(),
            f: null, g: emptyCell(), h: emptyCell().asSlice(),
            i: beginCell(), j: "hi json"
        };
    }
}