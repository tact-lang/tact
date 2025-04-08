struct OptionalDeep {
    inner: OptionalMiddle?;
}

struct OptionalMiddle {
    inner: OptionalLeaf?;
}

struct OptionalLeaf {
    val: Int;
}

contract OptionalDeepTest {
    data: OptionalDeep;

    init() {
        self.data = OptionalDeep{
            inner: null,
        };
    }
}