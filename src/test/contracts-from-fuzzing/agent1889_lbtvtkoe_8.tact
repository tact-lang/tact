struct Child1 {
    a: Int;
    b: Bool;
}

struct Child2 {
    s: String;
    n: Int?;
}

struct Parent {
    c1: Child1;
    c2: Child2;
    flag: Bool;
    msg: String?;
}

contract DiverseNested {
    storage: Parent;

    init() {
        self.storage = Parent{
            c1: Child1{a: 1, b: true},
            c2: Child2{s: "abc", n: 42},
            flag: false,
            msg: null
        };
    }
}