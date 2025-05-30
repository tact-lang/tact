struct A {
    int1: Int;
    bool1: Bool;
    string1: String;
    addr1: Address;
    cell1: Cell;
    slice1: Slice;
}

contract WideFields {
    storage: A;

    init() {
        self.storage = A{
            int1: 7,
            bool1: true,
            string1: "abc",
            addr1: myAddress(),
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
        };
    }
}