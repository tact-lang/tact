struct DefaultAndOpt {
    x: Int = 1;
    y: Int?;
}

contract MixedDefaultsOpt {
    d: DefaultAndOpt;

    init() {
        self.d = DefaultAndOpt{y: null};
    }
}