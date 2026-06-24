struct NestedOpt {
    inner_opt: Int?;
    flag: Bool;
}

struct DeepNestOpt {
    nested_opt: NestedOpt?;
    count: Int;
}

contract TestContract {
    data: DeepNestOpt;

    init() {
        self.data = DeepNestOpt{
            nested_opt: null,
            count: 123
        };
    }
}
