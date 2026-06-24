struct OptNested {
    val: Int?;
}

struct Container {
    inner: OptNested?;
}

contract NestedOpts {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}
