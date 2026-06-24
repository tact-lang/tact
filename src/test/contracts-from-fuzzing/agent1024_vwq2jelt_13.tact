struct GrandChild {
    z: Int;
}

struct Child {
    y: Int;
    grand: GrandChild;
}

struct Parent {
    x: Int;
    child: Child;
}

contract NestedMixed {
    data: Parent;

    init() {
        self.data = Parent{
            x:1,
            child: Child{
                y:2,
                grand: GrandChild{z:3}
            }
        };
    }
}