struct OptionalNest {
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    text: String?;
}

contract OptDeepTest {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            inner: InnerOpt{
                flag: true,
                text: null,
            },
        };
    }
}