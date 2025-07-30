struct DefaultOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptDefaultsTest {
    def: DefaultOpt;

    init() {
        self.def = DefaultOpt{};
    }
}