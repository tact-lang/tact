struct Child1 {
    x: Int;
}
struct Child2 {
    y: Int;
}

struct Parent {
    a: Child1?;
    b: Child2?;
    flag: Bool;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent{
            a: Child1{ x: 5 },
            b: null,
            flag: false
        };
    }
}