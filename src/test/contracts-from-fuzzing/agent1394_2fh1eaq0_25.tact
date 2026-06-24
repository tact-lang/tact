struct DefaultsOpt {
    optFlag: Bool?;
    count: Int = 17;
    val: String = "hi";
}

contract DefaultOptTest {
    data: DefaultsOpt;

    init() {
        self.data = DefaultsOpt{ optFlag: null };
    }
}