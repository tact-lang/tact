// Optional nested with default null and explicit non-null inner
struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt? = null;
}

contract NestedOptDefaults {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}