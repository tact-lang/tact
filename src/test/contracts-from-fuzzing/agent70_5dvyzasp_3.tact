struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract Test {
    optNested: OptionalNested;

    init() {
        self.optNested = OptionalNested{
            innerOpt: null
        };
    }
}