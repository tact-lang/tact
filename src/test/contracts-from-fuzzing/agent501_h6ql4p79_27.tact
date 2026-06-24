struct InnerOpt {
    num: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptOptTest {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{ inner: InnerOpt{ num: null } };
    }
}