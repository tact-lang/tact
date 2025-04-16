struct Innermost {
    z: Int = 5;
    t: String?;
}

struct Inner {
    a: Int = 1;
    b: Innermost = Innermost{ z:5, t:null };
}

struct Outer {
    in1: Inner = Inner{ a:1, b:Innermost{z:5, t:null} };
    in2: Inner;
}

contract NestedDefaults {
    storage: Outer;

    init() {
        self.storage = Outer{
            in1: Inner{ a: 3, b: Innermost{ z: 9, t: "hi" } },
            in2: Inner{ a: 7, b: Innermost{ z: 11, t: null } }
        };
    }
}
