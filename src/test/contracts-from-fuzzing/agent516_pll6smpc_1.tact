struct Nested {
    num: Int = 10;
    flag: Bool = true;
}

contract DeepNestedContract {
    data: Nested = Nested{};

    init() {
        self.data = Nested{};
    }
}