struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Int?;
}

contract Test {
    store: OptionalNested;

    init() {
        self.store = OptionalNested{
            innerOpt: Inner{ x:5, y: null }
        };
    }
}