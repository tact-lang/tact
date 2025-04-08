struct DeepInner {
    x: Int;
    y: String?;
}

struct Outer {
    inner: DeepInner;
    z: Bool?;
}

contract NestedStructStore {
    state: Outer;

    init() {
        self.state = Outer{
            inner: DeepInner{
                x: 11,
                y: null,
            },
            z: true,
        };
    }

    receive() {}
}