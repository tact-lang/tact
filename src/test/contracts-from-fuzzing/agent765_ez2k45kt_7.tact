struct OptionalNest {
    foo: Int?;
    bar: Int;
}

contract TestContract {
    first: OptionalNest?;
    second: Int;

    init() {
        self.first = OptionalNest{ foo: 33, bar: 44 };
        self.second = 55;
    }
}