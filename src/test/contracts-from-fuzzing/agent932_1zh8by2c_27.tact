// Confirm that nested optional inside optional struct fields is valid (but nested optionals themselves are rejected)
struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    x: Int;
}

contract NestedOptionalStructs {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{inner: null, x: 1};
    }
}