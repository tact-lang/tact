struct OptionalStruct {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Container {
    inside: OptionalStruct?;
}

contract OptionalContainer {
    state: Container;

    init() {
        self.state = Container{
            inside: null,
        };
    }
}