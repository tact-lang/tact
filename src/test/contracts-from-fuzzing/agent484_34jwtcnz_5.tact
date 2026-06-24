struct WithOptional {
    x: Int?;
    y: Bool?;
    z: String?;
}

contract OptionalTest {
    f: WithOptional;

    init() {
        self.f = WithOptional{
            x: null,
            y: true,
            z: null
        };
    }
}