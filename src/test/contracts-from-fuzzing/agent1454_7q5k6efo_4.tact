struct ManyFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Bool;
    f5: Int;
    f6: String;
    f7: Bool;
    f8: Int;
    f9: String;
    f10: Bool;
}

contract LotsFieldsTest {
    m: ManyFields;

    init() {
        self.m = ManyFields{
            f1: 1, f2: true, f3: "a",
            f4: false, f5: 42, f6: "b",
            f7: true, f8: 99, f9: "c",
            f10: false
        };
    }

    receive() {
        let _ = self.m.f6;
    }
}