struct Child {
    flag: Bool;
    label: String;
}

struct Parent {
    data: Child;
    counter: Int;
}

contract NestedMultiType {
    store: Parent;

    init() {
        self.store = Parent{
            data: Child{ flag: false, label: "no" },
            counter: 99,
        };
    }
}