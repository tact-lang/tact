struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNested {
    data: OuterOpt;

    init() {
        self.data = OuterOpt {
            inner: null
        };
    }
}