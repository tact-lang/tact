struct Child1 { a: Int; }
struct Child2 { b: Bool; }

struct Parent {
    f1: Child1;
    f2: Child2;
}

contract NestedDifferentStructs {
    data: Parent;

    init() {
        self.data = Parent{
            f1: Child1{a: 5},
            f2: Child2{b: true},
        };
    }
}