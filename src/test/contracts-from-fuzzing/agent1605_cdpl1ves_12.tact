struct AllPersistentTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract AllPersistentTypesTest {
    data: AllPersistentTypes;

    init() {
        self.data = AllPersistentTypes{
            i: 1,
            b: true,
            s: "str",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            oi: null,
            ob: null,
            os: null,
        };
    }
}