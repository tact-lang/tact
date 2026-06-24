struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null
        };
    }
}
