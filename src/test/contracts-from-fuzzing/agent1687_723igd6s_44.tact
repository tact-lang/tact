struct Extra {
    s: String;
    f: Bool;
}

struct Base {
    a: Int;
    b: Int;
}

contract MixedInlineDefaults {
    s: String = "hey";
    i: Int = 42;
    b: Base = Base{ a: 1, b: 2 };
    e: Extra = Extra{ s:"sss", f:true };

    init() {
        self.i = 100;
    }
}