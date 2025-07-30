struct OptionalContainer {
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract OptOptTest {
    data: OptionalContainer;

    init() {
        self.data = OptionalContainer{
            nested: null
        };
    }
}
