// Nested optional struct with optional fields inside
struct InnerOpt {
    v: Int?;
    s: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNest {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}