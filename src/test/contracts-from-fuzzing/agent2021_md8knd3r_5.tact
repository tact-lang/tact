struct InnerOpt {
    value: Bool?;
}

struct Container {
    inner: InnerOpt;
    text: String;
}

contract NestedOptionalBool {
    state: Container;

    init() {
        self.state = Container{
            inner: InnerOpt{ value: null },
            text: "test",
        };
    }
}
