struct DeepOpt {
    first: Int?;
    second: String?;
    third: Bool?;
}

struct Container {
    inner: DeepOpt;
    other: Int;
}

contract OptionalDeepContract {
    storage: Container;

    init() {
        self.storage = Container{
            inner: DeepOpt{
                first: null,
                second: null,
                third: true,
            },
            other: 55,
        };
    }
}