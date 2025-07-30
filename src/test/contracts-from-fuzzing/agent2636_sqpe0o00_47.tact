struct MixedOpt {
    optI: Int?;
    optS: String?;
    optB: Bool?;
}

contract MixedOptTest {
    data: MixedOpt;

    init() {
        self.data = MixedOpt{
            optI: null,
            optS: "hello",
            optB: null,
        };
    }
}