struct NestedOptional {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: NestedOptional?;
}

contract NestedOptionalTest {
    state: Container;

    init() {
        self.state = Container{ inner: null };
    }
}
