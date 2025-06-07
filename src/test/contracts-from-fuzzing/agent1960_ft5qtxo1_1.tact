struct NestedOptional {
    name: String?;
    age: Int?;
    active: Bool?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            name: null,
            age: 42,
            active: true,
        };
    }
}