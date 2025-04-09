struct OptionalNest {
    a: Int?;
    b: Inner?;
}

struct Inner {
    yes: Bool;
    msg: String?;
}

contract OptTest {
    store: OptionalNest;

    init() {
        self.store = OptionalNest{
            a: null,
            b: Inner{
                yes: true,
                msg: null,
            }
        };
    }
}