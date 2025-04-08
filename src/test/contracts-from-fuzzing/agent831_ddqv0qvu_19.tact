struct Compose {
    s1: String;
    s2: String;
    num1: Int;
    num2: Int;
    bool1: Bool;
    bool2: Bool;
    addr1: Address;
    addr2: Address;
    cell1: Cell;
    cell2: Cell;
    slice1: Slice;
    slice2: Slice;
}

contract CTest {
    field: Compose;

    init() {
        self.field = Compose{
            s1: "hello",
            s2: "world",
            num1: 11,
            num2: 22,
            bool1: true,
            bool2: false,
            addr1: myAddress(),
            addr2: myAddress(),
            cell1: emptyCell(),
            cell2: emptyCell(),
            slice1: emptyCell().asSlice(),
            slice2: emptyCell().asSlice()
        };
    }
}