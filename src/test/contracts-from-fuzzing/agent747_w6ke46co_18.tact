struct Child1 { a: Int; }
struct Child2 { b: Bool; }
struct Child3 { c: String; }

struct Parent {
    f1: Child1;
    f2: Child2;
    f3: Child3;
}

contract TestContract {
    myparent: Parent;

    init() {
        self.myparent = Parent{
            f1: Child1{ a: 1 },
            f2: Child2{ b: true },
            f3: Child3{ c: "hi" }
        };
    }
}
