struct Child {
    c1: Int;
    c2: Bool;
}

struct Parent {
    p1: Child;
    p2: Int;
    p3: String;
}

contract DeepStructTest {
    top: Parent;

    init() {
        self.top = Parent{
            p1: Child{c1: 5, c2: false},
            p2: 99,
            p3: "hello",
        };
    }
}