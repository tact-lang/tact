struct Child {
    num: Int;
    txt: String;
}

struct Parent {
    childA: Child;
    childB: Child;
    note: String?;
}

contract SameTypeNested {
    record: Parent;
    init() {
        self.record = Parent{
            childA: Child{ num: 1, txt: "a" },
            childB: Child{ num: 2, txt: "b" },
            note: null
        };
    }
}