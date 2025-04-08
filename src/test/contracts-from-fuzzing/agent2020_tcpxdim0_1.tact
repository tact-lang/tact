struct NestedExample {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    optA: Int?;
    optB: Bool?;
}

contract DeepStorageTest {
    field1: NestedExample;
    
    init() {
        self.field1 = NestedExample{
            a: 1,
            b: true,
            c: "test",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            optA: null,
            optB: true,
        };
    }
}
