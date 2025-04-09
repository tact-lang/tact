struct DefaultVals {
    x: Int = 5;
    y: Bool? = null;
    s: String = "default";
}

contract Defaults {
    state: DefaultVals;

    init() {
        self.state = DefaultVals{};
    }
}