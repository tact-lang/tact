struct WithOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    state: WithOptional;
    init() {
        self.state = WithOptional{
            a: 10,
            b: false,
            c: "hello"
        };
    }
}