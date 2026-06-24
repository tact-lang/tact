// Deeply nested optional inside struct field
struct DeepOpt {
    x: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
    txt: String?;
}

contract DeepNestedOption {
    f: DeepOpt;

    init() {
        self.f = DeepOpt{
            x: null,
            inner: InnerOpt{ val: null, txt: null }
        };
    }
}