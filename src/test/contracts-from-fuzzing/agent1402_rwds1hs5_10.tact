struct Innermost {
    s: String;
    b: Bool;
}

struct Inner {
    i: Int;
    m: Innermost;
}

struct Outer {
    inn: Inner;
    optI: Int?;
    optB: Bool?;
}

contract MixedNested {
    field: Outer;

    init() {
        self.field = Outer{
            inn: Inner{ i:5, m: Innermost{ s:"x", b:true } },
            optI: null,
            optB: false
        };
    }
}