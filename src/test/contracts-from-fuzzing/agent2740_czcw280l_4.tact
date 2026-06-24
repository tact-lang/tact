struct Child {
    x: Int;
}

struct Parent1 {
    child1: Child;
}

struct Parent2 {
    child2: Child;
}

contract MultiNestingTest {
    f1: Parent1;
    f2: Parent2;

    init() {
        self.f1 = Parent1{ child1: Child{ x: 11 } };
        self.f2 = Parent2{ child2: Child{ x: 42 } };
    }
}