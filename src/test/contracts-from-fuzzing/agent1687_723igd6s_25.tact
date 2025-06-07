struct ManyTypes {
    f1: Int;
    f2: Bool;
    f3: Cell;
    f4: Slice;
    f5: Address;
    f6: String;
}

contract ManyTypesTest {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{
            f1: 1,
            f2: true,
            f3: emptyCell(),
            f4: emptyCell().asSlice(),
            f5: myAddress(),
            f6: "str"
        };
    }
}