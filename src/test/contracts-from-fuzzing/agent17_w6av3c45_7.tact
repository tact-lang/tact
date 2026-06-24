struct Child {
    x: Int;
}

struct Parent {
    c1: Child;
    c2: Child;
    c3: Child;
}

contract NestedMultiple {
    val: Parent;
    
    init() {
        self.val = Parent{
            c1: Child{x:1},
            c2: Child{x:2},
            c3: Child{x:3}
        };
    }
}