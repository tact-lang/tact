struct Deep {
    id: Int;
    child: Child;
}

struct Child {
    label: String;
    maybeGrandchild: Grandchild?;
}

struct Grandchild {
    note: String;
    value: Int;
}

contract TestContract {
    d: Deep;

    init() {
        self.d = Deep{
            id: 7,
            child: Child{
                label: "nested",
                maybeGrandchild: null,
            },
        };
    }
}
