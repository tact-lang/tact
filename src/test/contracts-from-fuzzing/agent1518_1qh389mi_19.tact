struct Parent {
    sub: Child;
}

struct Child {
    sub: GrandChild;
}

struct GrandChild {
    value: Int?;
}

contract DeepOpt {
    p: Parent;

    init() {
        self.p = Parent{
            sub: Child{
                sub: GrandChild{ value: null }
            }
        };
    }
}