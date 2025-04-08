struct InnerOpt {
    s: String?;
    b: Bool;
}

contract NestedOpt {
    f: InnerOpt?;

    init() {
        self.f = InnerOpt{
            s: null,
            b: false
        };
    }
}