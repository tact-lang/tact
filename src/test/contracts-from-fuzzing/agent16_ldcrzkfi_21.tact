struct DeepOpt {
    sub: Int?;
}

struct OuterOpt {
    sub: DeepOpt?;
}

contract NestedOptionals {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            sub: null
        };
    }
}