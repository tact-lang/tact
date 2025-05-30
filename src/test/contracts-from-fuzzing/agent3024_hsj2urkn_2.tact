struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    inner: Inner;
    z: Bool;
}

contract DeepNestedTest {
    state: Outer;

    init() {
        self.state = Outer{inner: Inner{x: 42, y: "hi"}, z: false};
    }
}
