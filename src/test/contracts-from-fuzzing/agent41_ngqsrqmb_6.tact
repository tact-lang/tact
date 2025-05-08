struct OptionalNested {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: OptionalNested?;
    another: String;
}

contract OptionalDeep {
    state: Container;
    init() {
        self.state = Container{
            inner: null,
            another: "hi",
        };
    }
}