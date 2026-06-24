struct Mid {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    m: Mid;
    x: Int?;
}

contract NestedMix {
    f: Outer;
    init() {
        self.f = Outer{
            m: Mid{a:1, b:null, c:"hi"},
            x: null
        };
    }
}