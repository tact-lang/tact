struct A {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: String?;
    f5: Address;
    f6: Address?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
}

contract ManyTypes {
    field: A;

    init() {
        self.field = A{
            f1: 100,
            f2: true,
            f3: "test",
            f4: null,
            f5: myAddress(),
            f6: null,
            f7: emptyCell(),
            f8: null,
            f9: emptyCell().asSlice(),
            f10: null,
        };
    }
}