struct HasBooleans {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
}

struct HasInts {
    a: Int;
    b: Int;
    c: Int;
}

struct HasStrings {
    a: String;
    b: String;
}

contract MixOfStructs {
    f1: HasBooleans;
    f2: HasInts;
    f3: HasStrings;

    init() {
        self.f1 = HasBooleans{ a: true, b: false, c: true, d: false };
        self.f2 = HasInts{ a: 1, b: 2, c: 3 };
        self.f3 = HasStrings{ a: "a", b: "b" };
    }
}