struct StrBoolInt {
    s: String;
    b: Bool;
    i: Int;
}

contract MixedTypes {
    val: StrBoolInt;
    init() {
        self.val = StrBoolInt{ s: "Test", b: true, i: 999 };
    }
}