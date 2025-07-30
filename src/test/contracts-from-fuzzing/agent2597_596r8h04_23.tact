struct MixDefaultsOpt {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: String?;
}

contract MixDefaultsOptTest {
    field: MixDefaultsOpt;

    init() {
        self.field = MixDefaultsOpt{
            b: null,
            d: null,
        };
    }
}