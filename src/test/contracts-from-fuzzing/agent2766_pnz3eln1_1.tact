struct NestedOptional {
    num: Int?;
    text: String?;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            num: null,
            text: null,
        };
    }
}