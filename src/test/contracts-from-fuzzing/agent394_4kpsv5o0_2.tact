struct Big {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int?;
    f5: Bool?;
    f6: String;
    f7: Cell;
    f8: Slice;
    f9: String;
    f10: Int;
    f11: Bool;
}

contract TestStorage {
    value: Big;
    init() {
        self.value = Big{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: null,
            f5: false,
            f6: "test",
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: "str",
            f10: 123,
            f11: false
        };
    }
}