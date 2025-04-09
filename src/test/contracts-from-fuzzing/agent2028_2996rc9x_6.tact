struct Child {
    flag: Bool;
    comment: String;
}

struct Parent {
    childOpt: Child?;
    description: String;
}

contract OptNestedStruct {
    holder: Parent;

    init() {
        self.holder = Parent{
            childOpt: null,
            description: "optional nested"
        };
    }
}
