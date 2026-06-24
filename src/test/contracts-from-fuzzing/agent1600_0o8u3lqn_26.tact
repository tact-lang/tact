struct EmptyOptional {
    x: Int?;
}

contract EmptyOptionalFieldInit {
    eo: EmptyOptional;

    init() {
        self.eo = EmptyOptional{};
    }
}