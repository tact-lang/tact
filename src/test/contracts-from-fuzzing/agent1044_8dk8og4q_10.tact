struct ChildStruct {
    a: Int;
    b: Bool;
}

struct ParentStruct {
    child1: ChildStruct;
    child2: ChildStruct;
}

contract TestContract {
    state: ParentStruct;

    init() {
        self.state = ParentStruct{
            child1: ChildStruct{ a: 1, b: true },
            child2: ChildStruct{ a: 2, b: false }
        };
    }
}
