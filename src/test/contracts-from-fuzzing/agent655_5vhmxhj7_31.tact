// test optional nested inside optional struct
struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptNestTest {
    f: OuterOpt;
    init() {
        self.f = OuterOpt{ inner: null };
    }
}
