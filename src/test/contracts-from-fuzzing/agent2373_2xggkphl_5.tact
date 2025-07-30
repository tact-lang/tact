struct Complex {
    flag: Bool;
    count: Int;
    txt: String;
    slice: Slice;
    cell: Cell;
    addr: Address;
}

contract ComplexStruct {
    state: Complex;

    init() {
        self.state = Complex{
            flag: true,
            count: 42,
            txt: "hello",
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
            addr: myAddress(),
        };
    }
}