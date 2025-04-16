struct SInner {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct SMid {
    inner: SInner?;
}

contract NestedMultiOptional {
    f: SMid;
    init() {
        self.f = SMid{ inner: null };
    }
}