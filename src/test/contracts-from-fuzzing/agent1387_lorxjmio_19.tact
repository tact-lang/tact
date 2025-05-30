struct Mixed {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{
            a: 1,
            b: null,
            c: false,
            d: true,
            e: myAddress(),
            f: null,
            g: "hello",
            h: null,
            i: emptyCell(),
            j: null,
            k: emptyCell().asSlice(),
            l: null
        };
    }
}