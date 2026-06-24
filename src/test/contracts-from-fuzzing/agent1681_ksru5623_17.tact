struct WithBoolAndOptional {
    flag: Bool;
    maybeNum: Int?;
}

contract BoolOptTest {
    s: WithBoolAndOptional;
    init() {
        self.s = WithBoolAndOptional { flag: false, maybeNum: null };
    }
}