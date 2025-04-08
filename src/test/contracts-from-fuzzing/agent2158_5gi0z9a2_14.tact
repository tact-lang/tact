struct HasStringAndOptional {
    s: String;
    optInt: Int?;
}

contract StringOptTest {
    data: HasStringAndOptional;

    init() {
        self.data = HasStringAndOptional{ s: "hello", optInt: null };
    }
}