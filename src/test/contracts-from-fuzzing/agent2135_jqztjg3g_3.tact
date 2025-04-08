struct WithOptional {
    x: Int?;
    y: Bool?;
}

contract OptionalStructTest {
    val: WithOptional;

    init() {
        self.val = WithOptional{x: null, y: true};
    }
}