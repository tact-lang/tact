struct S {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Slice;
    f9: Address;
}

contract TestStorage {
    data: S;

    init() {
        self.data = S{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: "str",
            f6: null,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress(),
        };
    }
}