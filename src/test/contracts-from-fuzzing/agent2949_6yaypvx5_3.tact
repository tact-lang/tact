struct NestedOptional {
    value: Int?;
}

contract UsesNestedOptional {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ value: null };
    }
}
