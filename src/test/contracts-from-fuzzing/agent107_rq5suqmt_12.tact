struct DefaultsWithOption {
    k: Int = 7;
    opt: Bool?;
}

contract DefaultsOptTest {
    s: DefaultsWithOption;
    init() {
        self.s = DefaultsWithOption{ opt: null };
    }
}