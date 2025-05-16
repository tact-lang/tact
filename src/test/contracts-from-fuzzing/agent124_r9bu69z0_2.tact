struct WithOptional {
    name: String = "Default";
    score: Int?;
}

contract OptTest {
    data: WithOptional;

    init() {
        self.data = WithOptional{ };
    }
}