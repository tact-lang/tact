struct InnerOpt {
    a: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract OptionalNestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                a: 5
            }
        };
    }
}