struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;
    f5: Address;
    f6: Int?;
    f7: Bool?;
    f8: String?;
    f9: Cell;
    f10: Address?;
}

contract TestContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: "hi",
            f4: emptyCell(),
            f5: myAddress(),
            f6: null,
            f7: null,
            f8: null,
            f9: emptyCell(),
            f10: null
        };
    }
}