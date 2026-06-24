struct DefaultOptional {
    x: Int? = null;
    y: Bool? = true;
}

contract TestContract {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{};
    }
}