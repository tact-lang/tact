struct OptionalNest {
    innerOpt: Inner?;
}

struct Inner {
    x: Int;
    y: Bool?;
}

contract OptTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: Inner{ x: 18, y: true }
        };
    }
}