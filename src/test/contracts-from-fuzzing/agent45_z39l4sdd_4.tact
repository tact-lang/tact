struct OptionalNestInner {
    x: Int?;
    y: Bool?;
}

struct OptionalNestMiddle {
    inner: OptionalNestInner?;
}

contract OptionalNestTest {
    payload: OptionalNestMiddle;

    init() {
        self.payload = OptionalNestMiddle{
            inner: OptionalNestInner{
                x: null,
                y: true,
            }
        };
    }
}