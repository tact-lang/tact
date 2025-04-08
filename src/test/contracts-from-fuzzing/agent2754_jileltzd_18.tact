struct GrandChild {
    name: String;
    flag: Bool;
}

struct Child {
    grand: GrandChild;
    amount: Int;
}

struct Parent {
    child: Child;
    extra: Int;
}

contract DeepTree {
    data: Parent;

    init() {
        self.data = Parent{
            child: Child{
                grand: GrandChild{
                    name: "test",
                    flag: false
                },
                amount: 543
            },
            extra: 99
        };
    }
}
