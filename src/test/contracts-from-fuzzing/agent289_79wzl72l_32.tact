struct Child {
    a: Int;
    b: Bool;
}

struct Parent {
    name: String;
    child: Child;
}

contract NestedUpdateTest {
    state: Parent;

    init() {
        self.state = Parent{
            name: "Outer",
            child: Child{
                a: 123,
                b: false
            }
        };
    }
}