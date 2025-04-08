struct OptionalNested {
    val: Int?;
    sub: SubOpt?;
}

struct SubOpt {
    detail: Bool;
}

contract OptionInOption {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            val: null,
            sub: null,
        };
    }
}
