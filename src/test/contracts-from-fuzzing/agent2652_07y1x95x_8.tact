struct Child {
    foo: Int;
}

struct Parent {
    a: Int;
    child: Child;
}

struct Root {
    parent: Parent;
    b: Bool;
}

contract ComplexNest {
    data: Root;

    init() {
        self.data = Root{
            parent: Parent{
                a: 55,
                child: Child{ foo: 77 }
            },
            b: false
        };
    }
}