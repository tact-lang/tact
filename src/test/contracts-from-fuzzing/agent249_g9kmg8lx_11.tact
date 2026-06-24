struct P {
    x: Int = 7;
    y: Bool = false;
    msg: String?;
}

contract PartialDefaults {
    state: P;

    init() {
        self.state = P{
            y: true
        };
    }

    receive() {
        let _ = self.state.x;
    }
}