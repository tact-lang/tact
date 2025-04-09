struct NestedOptional {
    nOpt1: Int?;
    nOpt2: Bool?;
    nOpt3: String?;
}

struct WithNestedOptionals {
    wnoField1: NestedOptional?;
    wnoField2: Int;
}

contract ComplexOptionalsContract {
    data: WithNestedOptionals;

    init() {
        self.data = WithNestedOptionals{
            wnoField1: null,
            wnoField2: 99,
        };
    }

    receive() {}
}