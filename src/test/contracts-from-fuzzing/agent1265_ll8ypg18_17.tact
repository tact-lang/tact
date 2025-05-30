struct Container {
    a: Int;
    b: Bool;
    inner: Inner;
}

struct Inner {
    x: Int;
    y: String;
}

contract NestedContainer {
    val: Container;
    init() {
        self.val = Container{
            a: 10,
            b: true,
            inner: Inner{
                x: 5,
                y: "xyz",
            },
        };
    }
}