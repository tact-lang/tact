struct MixDefaultsOpt {
    a: Int = 1;
    b: Bool?;
    c: String?;
    d: Bool = false;
    e: Int?;
}

contract MixDefaultsOptTest {
    data: MixDefaultsOpt;

    init() {
        self.data = MixDefaultsOpt{
            b: null, c: "hi", e: 42
        };
    }
}