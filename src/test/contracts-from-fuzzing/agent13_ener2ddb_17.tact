struct Child {
    x: Int;
    y: String;
    opt: Bool?;
}

struct Parent {
    a: Child;
    b: Child?;
}

contract OptNested {
    data: Parent;

    init() {
        self.data = Parent{
            a: Child{ x: 10, y: "A", opt: true },
            b: null
        };
    }
}