struct WithStringDefault {
    s: String = "default str";
    x: Int;
}

contract StringDefaults {
    w: WithStringDefault;

    init() {
        self.w = WithStringDefault{
            x: 10
        };
    }
}