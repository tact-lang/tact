struct A {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: String?;
    f7: Cell;
    f8: Cell?;
    f9: Slice;
    f10: Slice?;
}

contract AllPrimitiveVariants {
    item: A;

    init() {
        self.item = A{
            f1: 1,
            f2: true,
            f3: null,
            f4: null,
            f5: "test",
            f6: null,
            f7: emptyCell(),
            f8: null,
            f9: emptyCell().asSlice(),
            f10: null,
        };
    }
}