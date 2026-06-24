struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptInOpt {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}