struct Child1 {
    x: Int;
}
struct Child2 {
    y: Int;
}
struct Parent {
    a: Child1;
    b: Child2;
}

contract Complex {
    data: Parent;
    init() {
        self.data = Parent{
            a: Child1{ x: 10 },
            b: Child2{ y: 20 }
        };
    }
}