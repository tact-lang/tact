struct OptionalNested {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    nestedOpt: OptionalNested?;

    init() {
        self.nestedOpt = null;
    }
}