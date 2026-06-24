struct DeepNestedOpt {
    i: Int?;
    s: String?;
}

struct Container {
    inner: DeepNestedOpt?;
    b: Bool;
}

contract DeepOptTest {
    x: Container;

    init() {
        self.x = Container{
            inner: DeepNestedOpt{
                i: null,
                s: null,
            },
            b: true,
        };
    }
}
