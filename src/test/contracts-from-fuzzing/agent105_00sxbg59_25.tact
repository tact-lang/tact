struct DefaultOptTest {
    a: Int?;
    b: Bool?;
}

contract DefOptInit {
    data: DefaultOptTest;

    init() {
        self.data = DefaultOptTest{
            a: null,
            b: null,
        };
    }
}