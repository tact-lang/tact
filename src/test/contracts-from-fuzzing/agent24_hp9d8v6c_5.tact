struct OptionalNest {
    val: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    text: String?;
}

contract OptionalStructTest {
    s: OptionalNest;

    init() {
        self.s = OptionalNest{
            val: null,
            inner: null,
        };
    }
}