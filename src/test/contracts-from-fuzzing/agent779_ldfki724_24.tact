struct DefaultVals {
    x: Int = 5;
    y: Bool = false;
    z: String = "def";
}

contract DefaultsPersist {
    state: DefaultVals;

    init() {
        self.state = DefaultVals{};
    }
}