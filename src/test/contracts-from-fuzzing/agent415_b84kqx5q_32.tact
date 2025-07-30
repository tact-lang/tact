struct ChildStruct {
    alpha: Int;
    beta: Bool;
}

struct ParentStruct {
    payload: ChildStruct;
    flag: Bool;
}

contract NestedSimple {
    state: ParentStruct;

    init() {
        self.state = ParentStruct{
            payload: ChildStruct{
                alpha: 321,
                beta: true
            },
            flag: false
        };
    }
}