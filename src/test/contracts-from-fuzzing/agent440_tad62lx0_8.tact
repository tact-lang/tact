struct InnerOpt {
    val: Int?;
    flag: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    count: Int;
}

contract TestContract {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inner: null,
            count: 0
        };
    }
}