struct EmptyOptionals {
    a: Int?;
    b: Bool?;
}

contract DefaultsAreNull {
    f: EmptyOptionals;
    init() {
        self.f = EmptyOptionals{};
    }
}