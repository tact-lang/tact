struct BasicTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract FuzzTest {
    storage: BasicTypes;

    init() {
        self.storage = BasicTypes{
            a: 1,
            b: true,
            c: "hello",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()};
    }
}
