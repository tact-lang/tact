struct SOpt {
    txt: String?;
}

struct S2 {
    inner: SOpt?;
}

contract OptStructTest {
    f: S2;
    init() {
        self.f = S2{ inner: null };
    }
}