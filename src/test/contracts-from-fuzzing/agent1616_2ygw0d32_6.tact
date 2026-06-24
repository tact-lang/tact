struct NestedOption {
    text: String?;
    num: Int?;
}

contract NestedOptContract {
    data: NestedOption = NestedOption{};

    init() {
        self.data = NestedOption{text: "hello", num: null};
    }
}