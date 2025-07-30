struct XInner {
    s: String;
}

struct XOuter {
    inner: XInner;
    optInt: Int?;
}

contract ComplexTypes {
    data: XOuter;

    init() {
        self.data = XOuter{
            inner: XInner{ s: "text" },
            optInt: null
        };
    }
}