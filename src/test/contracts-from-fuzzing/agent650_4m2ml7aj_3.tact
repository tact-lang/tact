struct OptionalInner {
    name: String;
    flag: Bool;
}

contract TestContract {
    nestedOpt: OptionalInner?;

    init() {
        self.nestedOpt = null;
    }
}
