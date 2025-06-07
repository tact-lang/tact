struct InnerOpt {
    foo: Int?;
}

struct OuterOpt{
    inner: InnerOpt?;
}

contract OptInOpt {
    x: OuterOpt;

    init() {
        self.x = OuterOpt{ inner: null };
    }
}