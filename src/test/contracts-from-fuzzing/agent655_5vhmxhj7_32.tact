// non-optional struct, with a nested optional struct with optional fields
struct NestedOpt {
    a: Int?;
    b: Bool?;
}

struct Wrapper {
    inner: NestedOpt?;
}

contract OptStructWrap {
    s: Wrapper;
    init() {
        self.s = Wrapper{ inner: null };
    }
}
