struct StrBoolInt {
    s: String;
    b: Bool;
    i: Int;
}

contract StrBoolIntContract {
    dat: StrBoolInt;

    init() {
        self.dat = StrBoolInt{ s: "test", b: true, i: 100 };
    }
}