// Optional String inside nested struct with sibling bool
struct Child {
    name: String?;
}

struct Parent {
    c: Child;
    active: Bool;
}

contract NestedStringOptional {
    p: Parent;

    init() {
        self.p = Parent{c: Child{name:null}, active: true};
    }
}