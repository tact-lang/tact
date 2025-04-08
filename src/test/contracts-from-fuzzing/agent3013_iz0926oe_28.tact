struct Base {
    inner: String = "";
}

contract DefaultNested {
    x: Base;

    init() {
        self.x = Base{};
    }
}
