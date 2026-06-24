struct Child {
    val: Int;
}

struct Parent {
    first: Int;
    nested: Child?; 
    last: Int;
}

contract Test {
    p: Parent;

    init() {
        self.p = Parent {
            first: 1,
            nested: null,
            last: 99,
        };
    }
}
