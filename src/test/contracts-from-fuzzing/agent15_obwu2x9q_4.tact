struct BigStructWithManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Bool;
    f5: Int?;
    f6: Bool?;
    f7: String;
    f8: String?;
    f9: Cell;
    f10: Slice;
}

contract ManyFieldsContract {
    big: BigStructWithManyFields;

    init() {
        self.big = BigStructWithManyFields{
            f1: 1,
            f2: 2,
            f3: true,
            f4: false,
            f5: null,
            f6: null,
            f7: "hello",
            f8: null,
            f9: emptyCell(),
            f10: emptyCell().asSlice(),
        };
    }
}