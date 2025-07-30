struct Base {
    num: Int?;
}

contract OptionalInit {
    b: Base;
    init() {
        self.b = Base{};
    }
}
