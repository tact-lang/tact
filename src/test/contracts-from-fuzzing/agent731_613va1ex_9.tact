struct Child {
    value: Int = 1;
}

struct Parent {
    child1: Child;
    child2: Child;
}

contract SiblingStructs {
    p: Parent;

    init() {
        self.p = Parent{ child1: Child{}, child2: Child{} };
    }
}