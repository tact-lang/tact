struct OptionalOuter {
    nestedField: Int?;
    strField: String?;
}

contract TestContract {
    s: OptionalOuter?;

    init() {
        self.s = null;
    }
}