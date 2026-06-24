struct Middle {
    inner: Int?;
    message: String;
}

struct Container {
    level: Middle?;
    another: Int;
}

contract OptionalMidLevel {
    storage: Container;

    init() {
        self.storage = Container{
            level: null,
            another: 42
        };
    }
}