struct InnerOpt {
    z: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract NestedStructsOptionals {
    opt: OuterOpt;
    init() {
        self.opt = OuterOpt { inner: null };
    }
}