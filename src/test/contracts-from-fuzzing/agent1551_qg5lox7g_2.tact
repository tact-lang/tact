struct ManyFields {
    f1: Int;
    f2: Int?;
    f3: Bool;
    f4: Bool?;
    f5: Cell;
    f6: Cell?;
    f7: Address;
    f8: Address?;
    f9: String;
    f10: String?;
}

contract ManyTypes {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: null,
            f3: true,
            f4: false,
            f5: emptyCell(),
            f6: null,
            f7: myAddress(),
            f8: null,
            f9: "hello",
            f10: null,
        };
    }
}