struct SerializeOptional {
    a: Int? as uint8;
    b: Bool?;
}

contract SerializeOptTest {
    data: SerializeOptional;

    init() {
        self.data = SerializeOptional{
            a: 128,
            b: true
        };
    }
}