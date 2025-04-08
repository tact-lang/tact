struct P {
    v: Int;
}

contract OptionalFieldContract {
    f: P?;

    init() {
        self.f = null;
    }
}
