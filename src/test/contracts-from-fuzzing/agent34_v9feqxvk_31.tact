struct SubStruct {
    val: Int;
}

struct ParentStruct {
    sub: SubStruct;
}

contract LayeredStructNullable {
    state: ParentStruct?;

    init() {
        self.state = ParentStruct{
            sub: SubStruct{ val: 42 }
        };
    }
}