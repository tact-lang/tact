struct GrandChild {
    msg: String?;
}

struct Child {
    one: GrandChild;
    two: GrandChild;
}

struct Parent {
    child: Child;
    other: Bool;
}

contract DeepStructure {
    state: Parent;

    init() {
        self.state = Parent{
            child: Child{
                one: GrandChild{ msg: null },
                two: GrandChild{ msg: "hi" },
            },
            other: true,
        };
    }
}