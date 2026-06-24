struct Child {
    c1: Int;
    c2: Bool;
    c3: String;
}

struct Parent {
    p1: Int;
    p2: Bool;
    p3: String;
    child1: Child;
    child2: Child;
    child3: Child;
}

contract TestContract {
    parent: Parent;

    init() {
        self.parent = Parent{
            p1: 1,
            p2: true,
            p3: "P",
            child1: Child{ c1: 10, c2:true, c3:"A" },
            child2: Child{ c1: 20, c2:false, c3:"B" },
            child3: Child{ c1: 30, c2:true, c3:"C" },
        };
    }
}