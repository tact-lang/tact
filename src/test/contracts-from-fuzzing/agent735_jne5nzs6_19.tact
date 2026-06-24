struct InnerOpt {
    val: Int;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNullAssign {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}
