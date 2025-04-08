struct OptionalDeep {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    word: String;
    flag: Bool;
}

contract OptionalFieldTest {
    optField: OptionalDeep;

    init() {
        self.optField = OptionalDeep{
            innerOpt: InnerOpt{
                word: "test",
                flag: false,
            },
        };
    }
}