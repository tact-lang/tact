struct ManyTypes {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Builder;
    f7: Address;
}

contract ComplexStruct {
    storage: ManyTypes;

    init() {
        self.storage = ManyTypes{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: beginCell(),
            f7: myAddress()
        };
    }
}