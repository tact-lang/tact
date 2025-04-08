struct OptionalDeep {
    innerOpt: Middle?;
}

struct Middle {
    val: Int;
    deeper: Deeper?;
}

struct Deeper {
    flag: Bool;
}

contract TestContract {
    optDeep: OptionalDeep;

    init() {
        self.optDeep = OptionalDeep{
            innerOpt: null,
        };
    }
}