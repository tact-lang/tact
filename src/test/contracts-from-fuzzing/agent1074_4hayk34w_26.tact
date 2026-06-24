struct StrBoolInt {
    s: String;
    b: Bool;
    i: Int;
}

contract ChangeFieldOrder {
    x: StrBoolInt;

    init() {
        self.x = StrBoolInt {
            s: "foo",
            b: false,
            i: 77
        };
    }
}