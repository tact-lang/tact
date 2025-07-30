struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

struct TopOpt {
    wrapper: OuterOpt?;
}

contract MultiLayerOptionals {
    top: TopOpt;

    init() {
        self.top = TopOpt{
            wrapper: null
        };
    }
}