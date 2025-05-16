struct OptNested {
    s: String?;
    inner: InnerOpt?;
}

struct InnerOpt {
    x: Int;
    y: Bool;
}

contract OptInOpt {
    data: OptNested;

    init() {
        self.data = OptNested{
            s: null,
            inner: null
        };
    }
}
