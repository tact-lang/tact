struct TailOptional {
    id: Int;
    text: String?;
}

contract TailOptTest {
    record: TailOptional;

    init() {
        self.record = TailOptional{
            id: 99,
            text: null,
        };
    }
}
