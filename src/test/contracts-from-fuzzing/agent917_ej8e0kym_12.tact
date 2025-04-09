struct NestedOpt {
    x: Int?;
    y: Bool?;
}

struct Container {
    inner: NestedOpt?;
}

contract OptInOpt {
    data: Container;

    init() {
        self.data = Container{ inner: null };
    }
}