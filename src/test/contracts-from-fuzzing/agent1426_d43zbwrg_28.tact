struct IntBoolString {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedValues {
    v: IntBoolString;

    init() {
        self.v = IntBoolString{
            i: 1, b: true, s: "hello"
        };
    }
}