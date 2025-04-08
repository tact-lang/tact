struct Child {
    x: Int;
    y: String;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract Test {
    field: Parent;

    init() {
        self.field = Parent{
            c1: Child{x:1,y:"A"},
            c2: Child{x:2,y:"B"}
        };
    }
}