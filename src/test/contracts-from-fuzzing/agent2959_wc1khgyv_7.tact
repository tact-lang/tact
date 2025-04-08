struct Child1 {
    val: Int;
}

struct Child2 {
    item: Child1;
}

struct Parent {
    c1: Child1;
    c2: Child2;
}

contract SiblingsNesting {
    state: Parent;

    init() {
        self.state = Parent{
            c1: Child1{val:1},
            c2: Child2{item: Child1{val:2}}
        };
    }
}