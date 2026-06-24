struct HasBoolOpt {
    is_enabled: Bool?;
    name: String;
}

contract BoolOptTest {
    f: HasBoolOpt;

    init() {
        self.f = HasBoolOpt{
            is_enabled: null,
            name: "check"
        };
    }
}