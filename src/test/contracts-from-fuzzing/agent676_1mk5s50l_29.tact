struct ChainOpt {
    n1: Opt1?;
    flag: Bool;
}

struct Opt1 {
    n2: Opt2?;
    value: Int;
}

struct Opt2 {
    innerVal: Int;
}

contract NestedOptionals {
    data: ChainOpt;

    init() {
        self.data = ChainOpt {
            n1: Opt1 {
                n2: null,
                value: 123
            },
            flag: true
        };
    }
}