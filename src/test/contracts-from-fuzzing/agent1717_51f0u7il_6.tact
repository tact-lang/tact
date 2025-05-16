struct A {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Slice;
    f6: Address;
    f7: Bool?;
    f8: String?;
    f9: Cell?;
    f10: Slice?;
    f11: Address?;
}

contract TestContract {
    mixed: A;

    init() {
        self.mixed = A{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: emptyCell().asSlice(),
            f6: myAddress(),
            f7: null,
            f8: null,
            f9: null,
            f10: null,
            f11: null,
        };
    }
}