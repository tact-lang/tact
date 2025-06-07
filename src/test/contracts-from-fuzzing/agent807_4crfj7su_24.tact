// optional nested struct INSIDE optional struct field (different construction)
struct DeepInner {
    field: Int?;
}

struct MiddleOpt {
    inner: DeepInner;
}

contract OptOptTest {
    some: MiddleOpt?;
    init() {
        self.some = null;
    }
}