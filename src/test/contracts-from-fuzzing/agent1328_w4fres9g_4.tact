struct DeepOptional {
    x: Int?;
    y: Bool?;
    z: Address?;
}

struct Container {
    nested: DeepOptional;
    num: Int;
}

contract OptionalNested {
    state: Container;

    init() {
        self.state = Container{
            nested: DeepOptional{
                x: null,
                y: null,
                z: null
            },
            num: 55
        };
    }
}
