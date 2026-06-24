struct DefaultMix {
    x: Int = 1;
    y: String;
}

contract MixedInit {
    state: DefaultMix;

    init() {
        self.state = DefaultMix{ y: "yo" };
    }
}
