struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Address;
    f4: Int;
    f5: Bool;
    f6: Address;
    f7: Int;
    f8: Bool;
    f9: Address;
    f10: Int;
}

contract LotsOfFields {
    big: ManyFields;

    init() {
        self.big = ManyFields{
            f1: 1, f2: true, f3: myAddress(),
            f4: 2, f5: false, f6: myAddress(),
            f7: 3, f8: true, f9: myAddress(),
            f10: 4
        };
    }
}