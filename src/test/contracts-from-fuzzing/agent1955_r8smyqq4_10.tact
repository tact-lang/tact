struct ChildOptional {
    a: Int?;
    b: Bool?;
}

struct ParentWithOpt {
    child: ChildOptional?;
}

contract NestedOptStruct {
    data: ParentWithOpt;

    init() {
        self.data = ParentWithOpt{
            child: ChildOptional{
                a: 5,
                b: null,
            },
        };
    }
}
