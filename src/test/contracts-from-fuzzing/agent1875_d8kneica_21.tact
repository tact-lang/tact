struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract FuzzAssignOptEmpty {
    field: OuterOpt;
    init() {
        self.field = OuterOpt {
            inner: InnerOpt {}
        };
    }
}
