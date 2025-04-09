struct WithDefault {
    x: Int = 1;
}

contract DefaultStructField {
    val: WithDefault;

    init() {
        self.val = WithDefault{};
    }
}