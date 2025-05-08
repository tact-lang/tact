struct InnerLevel {
    alpha: Int;
    beta: Bool;
}

struct OuterLevel {
    pointX: Int;
    optFlag: Bool?;
    nested: InnerLevel;
}

contract NestedStructsWithOptionals {
    state: OuterLevel;

    init() {
        self.state = OuterLevel{
            pointX: 42,
            optFlag: null,
            nested: InnerLevel{
                alpha: 1,
                beta: true,
            },
        };
    }
}