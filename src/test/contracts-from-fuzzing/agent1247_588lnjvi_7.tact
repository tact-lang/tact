struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

struct OuterMost {
    middle: Middle?;
}

contract OptionalDeepNullable {
    state: OuterMost;

    init() {
        self.state = OuterMost{
            middle: null
        };
    }
}