struct OptionalsNested {
    one: Int?;
    two: InnerOpt?;
}

struct InnerOpt {
    flag: Bool?;
    msg: String?;
}

contract ContractWithNestedOptionals {
    data: OptionalsNested;

    init() {
        self.data = OptionalsNested{
            one: null,
            two: null
        };
    }
}