struct InnerOpt {
    a: Int?;
    b: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
    c: Int;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            c: 10
        };
    }
}