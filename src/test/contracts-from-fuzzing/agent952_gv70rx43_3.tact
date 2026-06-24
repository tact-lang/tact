struct InnerOpt {
    o: Int?;
}

struct OuterOpt {
    wrap: InnerOpt?;
}

contract TestContract {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            wrap: InnerOpt{o: null},
        };
    }
}
