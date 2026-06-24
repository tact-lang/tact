struct AnotherDeep {
    a: Int;
    b: Bool;
}

struct NextedAgain {
    deep: AnotherDeep;
    opt: Int?;
}

contract StackDeeper {
    nested: NextedAgain;

    init() {
        self.nested = NextedAgain{
            deep: AnotherDeep{ a: 777, b: true },
            opt: null
        };
    }
}
