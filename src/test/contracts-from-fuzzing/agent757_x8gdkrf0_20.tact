struct Mixed {
    a: Int;
    b: Int as uint8;
    c: Int as int32;
    d: String;
    e: Bool;
    f: Address;
    g: Cell;
    h: Slice;
}

contract TestContract {
    dat: Mixed;

    init() {
        self.dat = Mixed{
            a: 1,
            b: 2,
            c: 3,
            d: "str",
            e: true,
            f: myAddress(),
            g: emptyCell(),
            h: emptyCell().asSlice()
        };
    }
}