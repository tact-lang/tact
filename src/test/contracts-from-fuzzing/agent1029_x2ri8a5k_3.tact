struct OptNested {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    field: OptNested;

    init() {
        self.field = OptNested{x: null, y: true};
    }
}