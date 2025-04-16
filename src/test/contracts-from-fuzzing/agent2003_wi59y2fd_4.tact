struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: String;
    f5: Int;
    f6: Bool;
    f7: Address;
    f8: String;
    f9: Int;
    f10: Bool;
}

contract TestContract {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            f1: 1,
            f2: true,
            f3: myAddress(),
            f4: "x",
            f5: 5,
            f6: false,
            f7: myAddress(),
            f8: "y",
            f9: 9,
            f10: true,
        };
    }
}
