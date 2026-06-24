struct NestedBoolInt {
    a: Bool;
    b: Int;
}

struct NestedIntOptBool {
    a: Int;
    b: Bool?;
}

contract MixStructs2 {
    s1: NestedBoolInt;
    s2: NestedIntOptBool;

    init() {
        self.s1 = NestedBoolInt{ a: true, b: 123 };
        self.s2 = NestedIntOptBool{ a: 456, b: null };
    }
}