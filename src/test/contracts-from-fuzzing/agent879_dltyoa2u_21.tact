struct S {
    x: Int;
}

struct OuterOpt {
    inner: S?;
}

contract OuterOptTest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{ inner: null };
    }
}
