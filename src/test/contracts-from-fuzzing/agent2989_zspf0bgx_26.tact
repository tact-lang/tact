struct EmptyOptional {
    opt: Int?;
}

contract DefaultsWithNull {
    f: EmptyOptional;

    init() {
        self.f = EmptyOptional{};
    }
}
