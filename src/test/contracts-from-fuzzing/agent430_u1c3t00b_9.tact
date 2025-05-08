struct OptionalNestedDefault {
    s: InnerDefault?;
}

struct InnerDefault {
    x: Int = 7;
    y: Bool = true;
}

contract Test {
    data: OptionalNestedDefault;

    init() {
        self.data = OptionalNestedDefault{
            s: null,
        };
    }
}