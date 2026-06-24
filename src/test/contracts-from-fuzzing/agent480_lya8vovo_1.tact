struct NestedExample {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    f: Address;
    g: Int?;
    h: String?;
}

contract StorageTest {
    data: NestedExample;

    init() {
        self.data = NestedExample{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            f: myAddress(),
            g: null,
            h: null,
        };
    }
}