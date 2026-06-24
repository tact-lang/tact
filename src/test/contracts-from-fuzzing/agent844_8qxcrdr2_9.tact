struct Child {
    id: Int;
    note: String?;
}

struct Parent {
    children: Child;
    count: Int;
    status: Bool;
}

contract NestedStructs {
    family: Parent;

    init() {
        self.family = Parent{
            children: Child{
                id: 1,
                note: null,
            },
            count: 2,
            status: true,
        };
    }

    receive() {
        let _ = self.family;
    }
}
