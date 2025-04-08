struct SBool {
    f: Bool;
    opt: Bool?;
}

struct SInt {
    i: Int;
    opt: Int?;
}

contract MixedStructFields {
    b: SBool;
    i: SInt;

    init() {
        self.b = SBool{ f: true, opt: false };
        self.i = SInt{ i: 7, opt: null };
    }
}
