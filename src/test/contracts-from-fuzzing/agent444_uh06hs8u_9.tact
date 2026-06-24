struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    nested: NestedOptionals?;
    value: Int;
}

contract NestedOptionalsContract {
    payload: Container;

    init() {
        self.payload = Container{ nested: null, value: 99 };
    }
}