struct OptionalNested {
    foo: Int;
    bar: Bool?;
}

contract TestContract {
    data: OptionalNested?;

    init() {
        self.data = null;
    }
}
