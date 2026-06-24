struct ChildLevel {
    val: Int;
}

struct ParentLevel {
    child1: ChildLevel;
    child2: ChildLevel;
    label: String;
}

contract MultipleNestedFields {
    storage: ParentLevel;

    init() {
        self.storage = ParentLevel{
            child1: ChildLevel{val:1},
            child2: ChildLevel{val:2},
            label: "go",
        };
    }
}
