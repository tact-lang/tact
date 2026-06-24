struct StrNest {
    s1: String;
    s2: String?;
}

struct Middle {
    nested: StrNest;
}

struct Outer {
    mid: Middle;
    optionalMid: Middle?;
}

contract TestContract {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Middle{ nested: StrNest{ s1:"a", s2:null } },
            optionalMid: null
        };
    }
}