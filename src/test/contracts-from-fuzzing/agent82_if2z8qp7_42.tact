struct OptDefaultNest {
    a: Int? = null;
    b: OptInner? = null;
}

struct OptInner {
    val: Int? = null;
}

contract Test {
    f: OptDefaultNest;

    init() {
        self.f = OptDefaultNest{};
    }
}