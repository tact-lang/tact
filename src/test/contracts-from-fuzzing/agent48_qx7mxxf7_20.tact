struct ComposeNestedOptional {
    innerOpt: Int?;
    wrapped: Bool;
}

struct UseNestedOpt {
    comp: ComposeNestedOptional;
    count: Int;
}

contract NestedOptStruct {
    data: UseNestedOpt;

    init() {
        self.data = UseNestedOpt{
            comp: ComposeNestedOptional{ innerOpt:null, wrapped:true },
            count: 5
        };
    }
}
