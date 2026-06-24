struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Bool;
    f4: Int?;
    f5: Bool?;
    f6: Int;
    f7: Bool;
    f8: Int?;
    f9: Bool?;
    f10: Int;
}

contract WideStructTest {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            f1: 1, f2: 2, f3: true, f4: null, f5: false, f6: 6, f7: true, f8: null, f9: null, f10: 10
        };
    }
}