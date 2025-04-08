struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: Int;
    f4: Bool;
    f5: Int;
    f6: Bool;
    f7: Int;
    f8: Bool;
    f9: Int;
    f10: Bool;
}

contract TestManyFields {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1,
            f2: true,
            f3: 3,
            f4: false,
            f5: 5,
            f6: true,
            f7: 7,
            f8: false,
            f9: 9,
            f10: true,
        };
    }
}