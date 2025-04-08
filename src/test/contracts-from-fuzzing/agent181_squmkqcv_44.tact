struct Wrapper {
    nested: InnerOpt?;
}

struct InnerOpt {
    s: String?;
}

contract OptionalCascade {
    d: Wrapper;

    init() {
        self.d = Wrapper{
            nested: null
        };
    }
}
