// optional struct field containing another optional struct
struct InnerMostOpt {
    val: Int;
}

struct InnerOpt {
    deep: InnerMostOpt?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt {
            inner: null
        };
    }
}