struct OptionalNested {
    s: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    num: Int?;
}

contract OptionalNestedStructTest {
    d: OptionalNested;

    init() {
        self.d = OptionalNested{
            s: null,
            inner: InnerOpt{
                flag: false,
                num: null
            }
        };
    }
}