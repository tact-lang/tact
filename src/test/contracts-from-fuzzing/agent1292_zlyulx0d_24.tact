struct NoOpt {
    i: Int;
}

struct TopOpt {
    value: NoOpt?;
}

contract OuterNullable {
    data: TopOpt;

    init() {
        self.data = TopOpt{
            value: null,
        };
    }
}