struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    nested: OptionalNested?;
}

contract TestContract {
    c: Container;

    init() {
        self.c = Container{
            nested: null
        };
    }
}