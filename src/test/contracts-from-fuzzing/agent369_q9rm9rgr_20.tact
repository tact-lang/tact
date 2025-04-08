struct InnerOpt {
    v1: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null
        };
    }
}