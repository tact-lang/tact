struct Child {
    a: Int;
    opt: String?;
}

struct Parent {
    c1: Child;
    c2: Child;
    b: Bool;
}

contract ManyNested {
    data: Parent;

    init() {
        self.data = Parent{
            c1: Child{a:1, opt:null},
            c2: Child{a:2, opt:"x"},
            b: true
        };
    }
}