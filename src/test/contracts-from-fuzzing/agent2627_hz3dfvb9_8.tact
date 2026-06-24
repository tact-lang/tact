struct Child {
    foo: Int;
}

struct Parent {
    childA: Child;
    childB: Child;
    childOpt: Child?;
}

contract MultiNested {
    storage: Parent;

    init() {
        self.storage = Parent{
            childA: Child{foo:1},
            childB: Child{foo:2},
            childOpt: null
        };
    }
}