struct GrandChild {
    c1: Int;
    c2: String?;
}

struct Child {
    b1: Bool;
    b2: GrandChild;
}

struct Parent {
    a1: Int?;
    a2: Child;
}

contract MultiplyNested {
    myState: Parent;

    init() {
        self.myState = Parent{
            a1: null,
            a2: Child{
                b1: true,
                b2: GrandChild{c1: 99, c2: null}
            }
        };
    }
}