struct DefaultOptional {
    a: Int?; // implicitly defaults to null
    b: Bool?; // implicitly defaults to null
}

contract OptionalDefault {
    field: DefaultOptional;

    init() {
        self.field = DefaultOptional{};
    }
}