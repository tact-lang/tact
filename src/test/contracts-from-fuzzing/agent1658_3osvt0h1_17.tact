struct OptInner {
    a: Int?;
    b: String?;
}

struct OuterS {
    inner: OptInner;
    c: Bool; 
}

contract OptInnerStructTest {
    s: OuterS;

    init() {
        self.s = OuterS{
            inner: OptInner{ a: null, b: null },
            c: true
        };
    }
}