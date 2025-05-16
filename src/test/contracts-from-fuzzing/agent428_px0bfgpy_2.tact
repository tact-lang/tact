struct WithOptional {
    x: Int?;
    y: Bool?;
}

contract OptionalTest {
    data: WithOptional;

    init() {
        self.data = WithOptional{ x: null, y: true };
    }
}
