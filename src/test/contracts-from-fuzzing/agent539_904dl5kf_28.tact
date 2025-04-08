struct OptionalAnnotated {
    x: Int? as uint32;
    y: Bool?;
}

contract TestContract {
    optAnn: OptionalAnnotated;
    init() {
        self.optAnn = OptionalAnnotated{
            x: null,
            y: null
        };
    }
}