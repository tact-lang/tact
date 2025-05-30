struct OptDeep {
    nestedOpt: Nested?;
}

struct Nested {
    x: Int?;
    y: Bool;
}

contract OptionalNested {
    data: OptDeep;

    init() {
        self.data = OptDeep{
            nestedOpt: null
        };
    }
}
