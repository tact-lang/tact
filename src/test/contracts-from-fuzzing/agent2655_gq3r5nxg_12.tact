struct Leaf {
    intVal: Int;
    boolVal: Bool;
}

struct Branch {
    left: Leaf?;
    right: Leaf?;
}

struct Root {
    branch1: Branch;
    branch2: Branch;
}

contract OptionalTree {
    data: Root;

    init() {
        self.data = Root{
            branch1: Branch{left: null, right: null},
            branch2: Branch{left: null, right: null},
        };
    }
}