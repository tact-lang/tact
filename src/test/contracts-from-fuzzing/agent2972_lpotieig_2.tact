struct Inner {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct Outer {
    inner: Inner;
}

contract NestedTest {
    val: Outer;

    init() {
        self.val = Outer{
            inner: Inner{
                x: 7,
                y: true,
                z: null,
            },
        };
    }
}
