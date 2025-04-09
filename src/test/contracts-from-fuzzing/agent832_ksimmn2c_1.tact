struct NestedOptional {
    name: String?;
    quantity: Int?;
}

contract TestContract {
    item: NestedOptional;

    init() {
        self.item = NestedOptional{
            name: null,
            quantity: null,
        };
    }
}