struct MultipleTypes {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Address;
}

contract VarietyStorage {
    data: MultipleTypes;

    init() {
        self.data = MultipleTypes{
            a: 1,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: "hi",
            f: myAddress()
        };
    }
}
