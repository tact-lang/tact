struct Sub {
    a: Int?;
    s: String;
    b: Bool?;
}

struct Outer {
    f1: Sub;
    f2: Sub;
    f3: Sub;
}

contract OptNested {
    outer: Outer;
    init() {
        self.outer = Outer{
            f1: Sub{ a: null, s: "a", b: null },
            f2: Sub{ a: 2, s: "b", b: true },
            f3: Sub{ a: null, s: "c", b: false }
        };
    }
}