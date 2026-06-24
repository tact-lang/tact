struct DeepNested2 {
    flag: Bool;
}

struct DeepNested1 {
    sub: DeepNested2;
}

struct DeepContainer {
    nested: DeepNested1;
    value: Int;
}

contract DeepContract {
    store: DeepContainer;

    init() {
        self.store = DeepContainer{
            nested: DeepNested1{
                sub: DeepNested2{
                    flag: true,
                },
            },
            value: 77,
        };
    }
}
