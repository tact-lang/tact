// Struct with optional nested struct with optional inside
struct InnerOpt {
    txt: String?;
}

struct OuterOpt {
    inner: InnerOpt?;
    num: Int;
}

contract NestedOptionalStructTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            inner: null,
            num: 404
        };
    }
}