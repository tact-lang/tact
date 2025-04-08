struct OptionalDeep {
    level1: Int?;
    level2: Bool?;
}

struct Container {
    opt: OptionalDeep?;
}

contract TestContract {
    field: Container;

    init() {
        self.field = Container{
            opt: OptionalDeep{
                level1: 42,
                level2: null,
            },
        };
    }
}