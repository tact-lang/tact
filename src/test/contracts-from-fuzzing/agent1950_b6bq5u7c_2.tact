struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int?;
    f4: Bool?;
    f5: String;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: String;
    f10: Address;
}

contract TestManyFields {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1: 1,
            f2: true,
            f3: null,
            f4: false,
            f5: "test",
            f6: myAddress(),
            f7: 7,
            f8: false,
            f9: "hello",
            f10: myAddress()
        };
    }
}
