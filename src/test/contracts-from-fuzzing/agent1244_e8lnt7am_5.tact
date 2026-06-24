struct NestedOptionals {
    one: Int?;
    two: Bool?;
}

struct Container {
    inner: NestedOptionals?;
    note: String?;
}

contract NestedOptContract {
    data: Container;

    init() {
        self.data = Container {
            inner: null,
            note: null,
        };
    }
}
