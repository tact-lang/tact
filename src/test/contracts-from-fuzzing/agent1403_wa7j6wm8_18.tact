struct MultiOpt {
    s_opt: String?;
    i_opt: Int?;
    b_opt: Bool?;
}

struct UsesOpt {
    inner_opt: MultiOpt?;
    flag: Bool;
}

contract NestedOptionals {
    data: UsesOpt;
    init() {
        self.data = UsesOpt{
            inner_opt: null,
            flag: true,
        };
    }
}