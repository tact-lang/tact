struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    nested: OptionalNested?;
    count: Int;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            nested: null,
            count: 1000,
        };
    }
}