struct OptionalNested {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Container {
    nested: OptionalNested?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container{nested: null};
    }
}