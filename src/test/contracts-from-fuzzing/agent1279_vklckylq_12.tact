struct Parent {
    a: Int;
    b: String?;
}

struct Child {
    p: Parent;
    c1: Bool;
    c2: Int?;
}

contract NestWithOpt {
    data: Child;

    init() {
        self.data = Child{
            p: Parent{ a:55, b:null },
            c1: true,
            c2: 42,
        };
    }
}