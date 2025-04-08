struct Inner {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

struct Container {
    inner: Inner? = Inner{};
    note: String? = null;
}

contract Test {
    data: Container;

    init() {
        self.data = Container{
            inner: Inner{
                x: 10,
                y: null,
                z: "ok"
            },
            note: null
        };
    }
}