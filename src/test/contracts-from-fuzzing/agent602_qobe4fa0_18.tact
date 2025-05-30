struct InnerOpt {
    data: Int?;
}

struct OuterOpt {
    info: InnerOpt?;
}

contract TestContract {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            info: InnerOpt{ data: null },
        };
    }
}