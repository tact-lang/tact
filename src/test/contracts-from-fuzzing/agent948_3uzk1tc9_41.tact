struct AllOptional {
    x: Int?;
    y: Int?;
    s: String?;
}

contract EmptyAllOptionals {
    data: AllOptional;

    init() {
        self.data = AllOptional{};
    }
}