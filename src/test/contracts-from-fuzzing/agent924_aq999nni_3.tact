struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    innerOpt: NestedOptionals?;
}

contract OptionalInOptional {
    state: Container;

    init() {
        self.state = Container{
            innerOpt: null,
        };
    }
}