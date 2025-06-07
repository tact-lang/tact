struct EmptyOptional {
    a: Int = 0;
    b: Bool?;
}

contract DefaultOptTest {
    data: EmptyOptional;

    init() {
        self.data = EmptyOptional{
            a: 42,
            b: null,
        };
    }
}