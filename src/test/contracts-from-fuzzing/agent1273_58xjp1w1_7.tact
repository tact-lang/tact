struct WithDefaults {
    count: Int = 5;
    message: String = "hi";
    flag: Bool;
}

contract DefaultedStructFieldTest {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{flag: true};
    }
}