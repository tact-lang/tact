struct ManyFields {
    f1: Int;
    f2: String;
    f3: Cell;
    f4: Bool;
    f5: Int;
    f6: String;
    f7: Cell;
    f8: Bool;
    f9: Int;
    f10: String;
}

contract ManyFieldsContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: "a",
            f3: emptyCell(),
            f4: true,
            f5: 2,
            f6: "b",
            f7: emptyCell(),
            f8: false,
            f9: 3,
            f10: "c",
        };
    }
}
