struct S {
    a: Int as uint8;
    b: Int = 300;
}

contract MixedSerializationAndDefaults {
    s: S;

    init() {
        self.s = S{ a: 5 };
    }
}