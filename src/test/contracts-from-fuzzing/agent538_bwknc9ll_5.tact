struct IntBoolStr {
    i: Int;
    b: Bool;
    s: String;
}

contract MixFields {
    field: IntBoolStr;

    init() {
        self.field = IntBoolStr{
            i: 42,
            b: false,
            s: "hello"
        };
    }
}
