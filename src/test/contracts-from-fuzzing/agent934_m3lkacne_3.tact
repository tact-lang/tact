struct ManyFields {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Bool;
    f7: String;
    f8: Int;
    f9: Bool?;
    f10: String;
    f11: Int;
    f12: Bool;
    f13: String;
    f14: Bool?;
    f15: Int;
}

contract ManyFieldsContract {
    storage: ManyFields;

    init() {
        self.storage = ManyFields{
            f1: 1, f2: 2, f3: 3, f4: 4, f5: 5,
            f6: true, f7: "hello", f8: 8, f9: null, f10: "world",
            f11: 11, f12: false, f13: "!", f14: null, f15: 15,
        };
    }
}