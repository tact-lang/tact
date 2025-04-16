struct DefaultAndOptional {
    a: Int = 1;
    b: Bool?;
    c: String = "hi";
    d: Int?;
}

contract TestContract {
    data: DefaultAndOptional;

    init() {
        self.data = DefaultAndOptional{};
    }
}
