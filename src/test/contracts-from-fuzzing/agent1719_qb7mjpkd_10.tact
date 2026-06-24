struct Child {
    v: Int;
}

struct Parent {
    c: Child?;
    name: String;
}

contract OptionalNestedStruct {
    s: Parent;

    init() {
        self.s = Parent{
            c: null,
            name: "opt"
        };
    }
}