struct EmptyOpt {
    foo: Int?;
}

contract DefaultOpt {
    bar: EmptyOpt;
    init() {
        self.bar = EmptyOpt{};
    }
}