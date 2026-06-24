struct DefaultsOpt {
    a: Int = 5;
    b: Int?;
}

contract DefOptTest {
    data: DefaultsOpt;
    init() {
        self.data = DefaultsOpt{
            b: null
        };
    }
}