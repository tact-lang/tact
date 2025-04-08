struct DefaultOpt {
    one: Int? = null;
    two: Bool? = null;
    three: Address? = null;
}

contract DefaultsOptionalTest {
    data: DefaultOpt;

    init() {
        self.data = DefaultOpt{};
    }
}
