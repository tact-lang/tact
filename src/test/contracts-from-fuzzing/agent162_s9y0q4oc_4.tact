struct WithDefaults {
    fixed: Int = 5;
    optFlag: Bool?;
    text: String = "abc";
}

contract TestContract {
    data: WithDefaults;

    init() {
        self.data = WithDefaults{
            optFlag: null
        };
    }
}