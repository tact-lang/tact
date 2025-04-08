struct ComposeOptional {
    s: String?;
}

contract OptionalSetToValue {
    f: ComposeOptional;

    init() {
        self.f = ComposeOptional{ s: "not null" };
    }
}
