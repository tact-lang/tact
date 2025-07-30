struct InnerOpt {
    i: Int?;
}

struct OuterOpt {
    inner: InnerOpt?;
}

contract TestContract {
    val: OuterOpt?;

    init() {
        self.val = OuterOpt{
            inner: InnerOpt{ i: 123 }
        };
    }
}