struct ChildStruct {
    x: Int;
}

struct ParentStruct {
    child: ChildStruct;
}

contract WrapperContract {
    p: ParentStruct;

    init() {
        self.p = ParentStruct{
            child: ChildStruct{
                x: 123
            }
        };
    }
}