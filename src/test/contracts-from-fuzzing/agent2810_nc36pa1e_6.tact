struct OptionalNested {
    sub: OptInner?;
}

struct OptInner {
    x: Int;
    y: Bool;
}

contract OptTest {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            sub: null
        };
    }
}
