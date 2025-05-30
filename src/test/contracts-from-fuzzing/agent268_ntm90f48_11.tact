struct Child {
    z: Int;
}

struct Parent {
    child1: Child;
    child2: Child;
}

struct GrandParent {
    parent: Parent;
}

contract MultiNested {
    gparent: GrandParent;

    init() {
        self.gparent = GrandParent{
            parent: Parent{
                child1: Child{z:1},
                child2: Child{z:2}
            }
        };
    }
}