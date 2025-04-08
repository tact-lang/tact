struct VaryTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Builder;
    f: Address;
    g: Cell;
}

contract VaryTypesContract {
    data: VaryTypes;

    init() {
        self.data = VaryTypes{
            a: 5,
            b: true,
            c: "hello",
            d: emptyCell().asSlice(),
            e: beginCell(),
            f: myAddress(),
            g: emptyCell(),
        };
    }
}