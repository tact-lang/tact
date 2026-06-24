struct Child1 { x: Int }
struct Child2 { y: Bool }
struct Parent {
    a: Child1;
    b: Child2;
}

contract TestContract {
    stuff: Parent;
    init() {
        self.stuff = Parent{ a: Child1{ x: 1 }, b: Child2{ y: false } };
    }
}
