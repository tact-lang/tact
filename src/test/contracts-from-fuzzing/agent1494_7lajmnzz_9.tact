struct Sub1 {
    s1: Int;
}

struct Sub2 {
    s2: Bool;
}

struct Parent {
    a: Sub1;
    b: Sub2;
}

contract MultiNested {
    nest: Parent;
    init() {
        self.nest = Parent{
            a: Sub1{ s1:42 },
            b: Sub2{ s2:true }
        };
    }
}