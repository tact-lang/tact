struct IntBoolString {
    i: Int;
    b: Bool;
    s: String;
}

contract MixedTypes {
    x: IntBoolString;

    init() {
        self.x = IntBoolString{
            i: 123,
            b: true,
            s: "test",
        };
    }
}