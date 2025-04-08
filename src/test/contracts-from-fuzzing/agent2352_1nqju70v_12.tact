struct Child {
    c1: Int;
    c2: String?;
}

struct Parent {
    p1: String;
    p2: Child?;
    p3: Bool;
}

contract MixedNestedOpts {
    foo: Parent;

    init() {
        self.foo = Parent{
            p1: "hello",
            p2: null,
            p3: true
        };
    }
}