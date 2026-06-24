struct Child {
    x: Int;
}

struct Parent {
    a: Int;
    b: Child;
}

contract StructDefaultOverride {
    data: Parent;

    init() {
        self.data = Parent{
            a: 5,
            b: Child{x: 7}
        };
    }
}