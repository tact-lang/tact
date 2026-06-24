struct WithDefaults {
    count: Int = 5;
    label: String = "test";
    flag: Bool = true;
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{};
    }

    receive() {
        let _ = self.data.count + 1;
    }
}