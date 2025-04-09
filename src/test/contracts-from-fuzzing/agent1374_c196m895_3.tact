struct OptionalInner {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    nestedOpt: OptionalInner;

    init() {
        self.nestedOpt = OptionalInner{a: null, b: true};
    }
}
