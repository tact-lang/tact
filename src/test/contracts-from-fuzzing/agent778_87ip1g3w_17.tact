struct WithOptional {
    a: Int?;
    b: Bool?;
}

contract OptAllFields {
    data: WithOptional;
    init() {
        self.data = WithOptional{ a: null, b: null };
    }
}