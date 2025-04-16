struct OptionalInner {
    name: String?;
    number: Int?;
}

contract ComplexOptionals {
    nestedOpt: OptionalInner?;

    init() {
        self.nestedOpt = OptionalInner{
            name: null,
            number: null
        };
    }
}