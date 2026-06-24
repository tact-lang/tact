struct ManyFields {
    a0: Int;
    a1: Bool;
    a2: String;
    a3: Int;
    a4: Bool;
    a5: String;
    a6: Int;
    a7: Bool;
    a8: String;
    a9: Int;
    a10: Bool;
    a11: String;
    a12: Int;
    a13: Bool;
    a14: String;
    a15: Int;
    a16: Bool;
    a17: String;
    a18: Int;
    a19: Bool;
}

contract TestContract {
    bigStruct: ManyFields;

    init() {
        self.bigStruct = ManyFields{
            a0: 1, a1: true, a2: "a", a3: 2, a4: false,
            a5: "b", a6: 3, a7: true, a8: "c", a9: 4,
            a10: false, a11: "d", a12: 5, a13: true, a14: "e",
            a15: 6, a16: false, a17: "f", a18: 7, a19: true
        };
    }
}