struct Child {
    val: Int;
}

struct Parent {
    childOpt: Child?;
    label: String;
}

contract NestedOptionalStruct {
    data: Parent;

    init() {
        self.data = Parent{
            childOpt: null,
            label: "test",
        };
    }
}