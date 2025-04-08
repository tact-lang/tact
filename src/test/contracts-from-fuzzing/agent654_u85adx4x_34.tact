message M {}

struct InnerOpt {
    m: M;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract C {
    data: OuterOpt?;

    init() {
        self.data = null;
    }
}