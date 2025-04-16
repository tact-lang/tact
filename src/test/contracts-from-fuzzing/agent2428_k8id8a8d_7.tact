struct OptionalNested {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{ x: null, y: null };
    }
}