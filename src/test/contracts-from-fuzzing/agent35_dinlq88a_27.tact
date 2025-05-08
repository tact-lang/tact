struct Child {
    a: Int?;
    b: Bool;
    c: String?;
}

struct Parent {
    one: Int;
    two: Bool?;
    child: Child;
}

contract TestContract {
    state: Parent;

    init() {
        self.state = Parent{
            one: 1,
            two: null,
            child: Child{ a: null, b: true, c: null }
        };
    }
}