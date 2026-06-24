struct OptionalWrapper {
    value: Int?;
}

contract Test {
    data: OptionalWrapper;
    init() {
        self.data = OptionalWrapper{ value: null };
    }
}