struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct ContainOpt {
    optStruct: NestedOptionals?;
    fixedInt: Int;
}

contract OptInOpt {
    state: ContainOpt;
    init() {
        self.state = ContainOpt{
            optStruct: NestedOptionals{
                a: null, b: null, c: null
            },
            fixedInt: 42
        };
    }
}