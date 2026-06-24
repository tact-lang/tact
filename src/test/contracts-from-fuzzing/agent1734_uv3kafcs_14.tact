struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Container {
    inner: Inner?;
    tag: Int;
}

contract Test {
    storage: Container;
    init() {
        self.storage = Container{ inner: null, tag: 42 };
    }
}