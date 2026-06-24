struct Child {
    foo: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
    c4: Child;
    c5: Child;
    c6: Child;
    c7: Child;
    c8: Child;
    c9: Child;
    c10: Child;
}

contract BigNestedList {
    data: Parent;
    init() {
        self.data = Parent{
            c1: Child{foo:1}, c2: Child{foo:2}, c3: Child{foo:3}, c4: Child{foo:4},
            c5: Child{foo:5}, c6: Child{foo:6}, c7: Child{foo:7}, c8: Child{foo:8},
            c9: Child{foo:9}, c10: Child{foo:10},
        };
    }
}
