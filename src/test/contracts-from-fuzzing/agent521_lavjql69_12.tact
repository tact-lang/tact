struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    a: Address;
}

contract ManyTypesContract {
    f: ManyTypes;

    init() {
        self.f = ManyTypes{
            i: 0,
            b: false,
            s: "",
            sl: emptyCell().asSlice(),
            c: emptyCell(),
            a: myAddress(),
        };
    }
}