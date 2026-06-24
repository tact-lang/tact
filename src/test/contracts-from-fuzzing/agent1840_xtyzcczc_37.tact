struct OptionalDeep {
    s: String?;
    inner: OptInner;
}

struct OptInner {
    a: Int?;
    b: Bool?;
}

contract OptDeepest {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            s: null,
            inner: OptInner{ a: null, b:true }
        };
    }
}