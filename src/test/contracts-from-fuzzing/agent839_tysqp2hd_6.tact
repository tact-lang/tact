struct Child {
    info: String;
    flag: Bool;
}

struct Parent {
    childOpt: Child?;
    value: Int?;
}

contract NestedOptionals {
    data: Parent;

    init() {
        self.data = Parent{
            childOpt: null,
            value: null,
        };
    }
}