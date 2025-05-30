struct OuterOpt {
    inn: InnerOpt?;
}

struct InnerOpt {
    val: Int?;
}

contract TestContract {
    s: OuterOpt;

    init() {
        self.s = OuterOpt{
            inn: null
        };
    }
}