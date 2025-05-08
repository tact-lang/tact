struct Container {
    intField: Int;
    boolField: Bool;
    optionalField: Int?;
}

contract ContainerOpt {
    boxed: Container?;

    init() {
        self.boxed = Container{
            intField: 99,
            boolField: false,
            optionalField: null
        };
    }
}
