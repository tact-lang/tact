struct WithBoolOptional {
    v: Bool?;
}

contract BoolOptional {
    x: WithBoolOptional;

    init() {
        self.x = WithBoolOptional{ v: null };
    }
}