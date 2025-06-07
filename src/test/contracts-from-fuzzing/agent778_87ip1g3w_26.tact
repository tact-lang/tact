struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inr: InnerOpt?;
    z: Int;
}

contract OptionalOptional {
    data: OuterOpt;
    init() {
        self.data = OuterOpt{
            inr: null,
            z: 55
        };
    }
}