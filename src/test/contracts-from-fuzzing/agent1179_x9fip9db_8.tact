struct OptionalNest {
    nested: String?;
    flag: Bool?;
}

contract TestContract {
    nestedOpt: OptionalNest?;

    init() {
        self.nestedOpt = null;
    }

    receive() {}
}