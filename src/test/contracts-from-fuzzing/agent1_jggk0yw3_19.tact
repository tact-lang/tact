struct Leaf {
    foo: Int;
}

struct Parent1 {
    leaf: Leaf;
}

struct Parent2 {
    leaf: Leaf;
}

contract MultiNested {
    p1: Parent1;
    p2: Parent2;

    init() {
        self.p1 = Parent1{ leaf: Leaf{ foo: 1 } };
        self.p2 = Parent2{ leaf: Leaf{ foo: 2 } };
    }
}