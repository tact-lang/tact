struct NestedOption {
    x: Int?;
    y: Bool?;
}

contract TestContract {
    data: NestedOption;

    init() {
        self.data = NestedOption{ x: null, y: true };
    }
}