struct DefaultOptional {
    x: Int? = null;
    y: Bool? = null;
}

contract DefOptHolder {
    field: DefaultOptional;

    init() {
        self.field = DefaultOptional{};
    }
}