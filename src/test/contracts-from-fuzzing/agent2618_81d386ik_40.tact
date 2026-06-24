struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    c: Cell;
}

contract AllTypesTest {
    f: ManyTypes;

    init() {
        self.f = ManyTypes{
            i: 1,
            b: false,
            s: "x",
            addr: myAddress(),
            c: emptyCell()
        };
    }
}