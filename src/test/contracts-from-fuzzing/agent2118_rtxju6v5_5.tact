struct StrNestInner {
    txt: String;
}

struct StrNestOuter {
    inner: StrNestInner;
    another: StrNestInner;
}

contract TestStrNest {
    complex: StrNestOuter;

    init() {
        self.complex = StrNestOuter{
            inner: StrNestInner{ txt: "a" },
            another: StrNestInner{ txt: "b" },
        };
    }
}