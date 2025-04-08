struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    f1: InnerOpt?;
    f2: InnerOpt?;
}

contract MultipleNullables {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            f1: null,
            f2: InnerOpt{
                x: null,
                y: null
            }
        };
    }
}
