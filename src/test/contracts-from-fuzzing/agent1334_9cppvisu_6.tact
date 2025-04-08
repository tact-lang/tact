struct Child {
    optionalInner: Bool?;
    text: String;
}

struct Parent {
    child1: Child?;
    child2: Child;
}

contract NestedOptional {
    nested: Parent;

    init() {
        self.nested = Parent{
            child1: null,
            child2: Child{optionalInner: false, text: "hi"}
        };
    }
}
