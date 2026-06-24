struct S {
    address: Address;
    text: String;
    data: Cell;
    slice: Slice;
    flag: Bool;
}

contract AllPrimitiveTypes {
    s: S;

    init() {
        self.s = S{
            address: myAddress(),
            text: "",
            data: emptyCell(),
            slice: emptyCell().asSlice(),
            flag: false
        };
    }
}