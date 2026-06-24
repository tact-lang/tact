struct MultipleTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
}

contract MultiTypesTest {
    data: MultipleTypes;

    init() {
        self.data = MultipleTypes{
            a: 1,
            b: true,
            c: "hi",
            d: beginCell().endCell().asSlice(),
            e: beginCell().endCell(),
            f: myAddress()
        };
    }
}
