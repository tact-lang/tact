struct MixedTypes {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Int as int8;
    f5: Int?;
    f6: Bool?;
    f7: Cell;
    f8: Slice;
    f9: Address;
}

contract TestContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            f1: 100,
            f2: true,
            f3: "abc",
            f4: 7,
            f5: null,
            f6: false,
            f7: emptyCell(),
            f8: emptyCell().asSlice(),
            f9: myAddress()
        };
    }
}