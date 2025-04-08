struct OptInner {
    value: Int?;
}

struct NullableOuter {
    x: Int;
    y: OptInner?;
}

contract NullableNestTest {
    state: NullableOuter;

    init() {
        self.state = NullableOuter{
            x: 1,
            y: null
        };
    }
}