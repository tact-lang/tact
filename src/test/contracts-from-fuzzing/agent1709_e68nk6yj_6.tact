struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    c: String?;
}

contract NestedOptionals {
    state: OuterOpt;
    init() {
        self.state = OuterOpt{
            inner: null,
            c: null,
        };
    }
}