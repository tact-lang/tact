struct DefaultOptional {
    a: Int?;
}

contract OptDefField {
    f: DefaultOptional;
    init() {
        self.f = DefaultOptional{};
    }
}
