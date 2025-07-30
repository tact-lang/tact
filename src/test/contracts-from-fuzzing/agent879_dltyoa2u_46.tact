struct ShouldBeInvalid {
    a: Int?;
    b: String?;
}

contract Test {
    data: ShouldBeInvalid;
    init() {
        self.data = ShouldBeInvalid{}; // both optional fields left 'unset'
    }
}
