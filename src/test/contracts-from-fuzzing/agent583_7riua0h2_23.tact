struct Child1 {
    a: Int;
}

struct Child2 {
    b: Bool;
}

contract StructList {
    c1: Child1;
    c2: Child2;

    init() {
        self.c1 = Child1{a: 5};
        self.c2 = Child2{b: false};
    }
}