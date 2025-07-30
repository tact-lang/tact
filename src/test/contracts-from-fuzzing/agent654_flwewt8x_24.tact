struct Nested {
    field: String?;
}
contract TestContract {
    nest: Nested?;
    init() {
        self.nest = null;
    }
}