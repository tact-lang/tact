struct EmptyOptional {
    x: Int?;
}

contract UnsetOptImplicitNull {
    a: Int;
    b: EmptyOptional;

    init() {
        self.a = 5;
        self.b = EmptyOptional{};
    }
}