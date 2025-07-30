struct InnerOpt {
    foo: Int? = null;
    bar: Bool? = null;
}

struct OuterOpt {
    val: InnerOpt = InnerOpt{};
    note: String? = null;
}

contract OptNest {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{};
    }
}