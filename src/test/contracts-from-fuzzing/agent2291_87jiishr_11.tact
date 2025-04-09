struct Sub1 {
    a: Int;
}
struct Sub2 {
    b: Int;
}
struct Sub3 {
    c: Int;
}

struct Root {
    f1: Sub1;
    f2: Sub2;
    f3: Sub3;
}

contract MultiStructsNested {
    root: Root;

    init() {
        self.root = Root{
            f1: Sub1{a:11},
            f2: Sub2{b:22},
            f3: Sub3{c:33}
        };
    }
}
