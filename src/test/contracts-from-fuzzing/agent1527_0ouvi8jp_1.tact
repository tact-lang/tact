struct NestedOptional {
    value: Int?;
}

contract TestContract {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{ value: null };
    }
}
