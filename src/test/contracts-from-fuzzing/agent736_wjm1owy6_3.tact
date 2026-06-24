struct WithDefaults {
    val: Int = 10;
    text: String = "hello";
    flag: Bool = false;
}

contract TestContract {
    data: WithDefaults = WithDefaults{};

    init() {
        self.data = WithDefaults{};
    }

    receive() {
        dump(self.data.val);
        dump(self.data.text);
        dump(self.data.flag);
    }
}