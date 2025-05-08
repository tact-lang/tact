struct OptionalOuter {
    opt: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract NestedOptional {
    s: OptionalOuter;

    init() {
        self.s = OptionalOuter{ opt: InnerOpt{ val: 9 } };
    }
}
