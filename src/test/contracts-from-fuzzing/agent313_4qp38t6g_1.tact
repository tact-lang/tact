struct NestedInner {
    x: Int;
    y: Bool;
}

struct NestedOuter {
    inner: NestedInner;
    z: String;
}

contract DeepNestedStructTest {
    val: NestedOuter;

    init() {
        self.val = NestedOuter{
            inner: NestedInner{x: 1, y: true},
            z: "test"
        };
    }
}