struct GrandChild {
    aa: Int;
    bb: Bool;
}

struct Child1 {
    x: GrandChild;
    y: Int;
}

struct Child2 {
    z: Bool;
    t: String;
}

struct ParentX {
    c1: Child1;
    c2: Child2;
}

contract FamilyTree {
    family: ParentX;
    init() {
        self.family = ParentX{
            c1: Child1{
                x: GrandChild{ aa: 77, bb: true },
                y: 8
            },
            c2: Child2{
                z: false,
                t: "tree"
            }
        };
    }
}