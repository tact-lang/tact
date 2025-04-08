struct Child {
    intVal: Int;
    boolVal: Bool;
}

struct Parent {
    child1: Child;
    child2: Child;
    strVal: String;
    flag: Bool;
    optInt: Int?;
}

contract NestedMany {
    p: Parent;

    init() {
        self.p = Parent{
            child1: Child{intVal: 1, boolVal: true},
            child2: Child{intVal: 2, boolVal: false},
            strVal: "nested",
            flag: true,
            optInt: null
        };
    }
}