struct Diversity {
    int1: Int;
    bool1: Bool;
    str1: String;
    cell1: Cell;
    slice1: Slice;
    builder1: Builder;
    addr1: Address;
}

contract DiverseStorage {
    d: Diversity;

    init() {
        self.d = Diversity{
            int1: 42,
            bool1: true,
            str1: "hi",
            cell1: emptyCell(),
            slice1: emptyCell().asSlice(),
            builder1: beginCell(),
            addr1: myAddress()
        };
    }
}