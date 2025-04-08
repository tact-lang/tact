struct Child {
    label: String;
    opt: Bool?;
}

struct Parent {
    id: Int;
    child: Child;
}

contract TestContract {
    p: Parent;

    init() {
        self.p = Parent{
            id: 1,
            child: Child{
                label: "x",
                opt: true,
            }
        };
    }
}