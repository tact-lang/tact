struct WithOptional {
    a: Int?;
    b: Bool?;
}

contract OptionalStructContract {
    data: WithOptional;

    init() {
        self.data = WithOptional{
            a: null,
            b: true
        };
    }
}