struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct OuterOpt {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner1: null,
            inner2: null
        };
    }
}