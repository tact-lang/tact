struct OptionalDeep {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int;
    valOpt: Bool?;
}

contract Test {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            innerOpt: null
        };
    }
}