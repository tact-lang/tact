struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract FuzzAssignNullOpt {
    field: OuterOpt;
    init() {
        self.field = OuterOpt {
            inner: null
        };
    }
}
