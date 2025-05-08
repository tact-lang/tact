struct Child1 {
    a: Int;
}
struct Child2 {
    b: Int;
}

struct Parent {
    c1: Child1;
    c2: Child2;
    num: Int;
}

contract MultiStructs {
    val: Parent;

    init() {
        self.val = Parent{
            c1: Child1{ a: 5 },
            c2: Child2{ b: 9 },
            num: 42
        };
    }
}
