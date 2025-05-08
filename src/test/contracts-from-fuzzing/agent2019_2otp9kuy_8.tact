struct NestedOption {
    x: Int?;
    y: String?;
}

contract WithNestedOptionals {
    data: NestedOption;

    init() {
        self.data = NestedOption {
            x: null,
            y: null
        };
    }
}