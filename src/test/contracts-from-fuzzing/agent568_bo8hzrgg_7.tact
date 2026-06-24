struct S {
    x: Int;
    y: Bool;
    str: String;
    cell: Cell;
    slice: Slice;
    addr: Address;
}

contract ManyTypes {
    storage: S;

    init() {
        self.storage = S{
            x: 1,
            y: false,
            str: "hello",
            cell: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}