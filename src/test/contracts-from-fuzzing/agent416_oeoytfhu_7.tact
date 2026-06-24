struct NestedOptional {
    number: Int?;
}

struct IncludesNestedOpt {
    innerOpt: NestedOptional?;
}

contract Test8 {
    data: IncludesNestedOpt;

    init() {
        self.data = IncludesNestedOpt{
            innerOpt: null
        };
    }
}
