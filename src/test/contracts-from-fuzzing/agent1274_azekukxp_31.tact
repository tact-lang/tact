struct ABool {
    ok: Bool;
}

struct AInt {
    number: Int;
}

struct AString {
    str: String;
}

contract MultipleStructFields {
    f1: ABool;
    f2: AInt;
    f3: AString;

    init() {
        self.f1 = ABool{ ok: true };
        self.f2 = AInt{ number: 123 };
        self.f3 = AString{ str: "done" };
    }
}