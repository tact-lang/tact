struct Mixed {
    ai: Int = 1;
    bi: Int;
    ab: Bool = false;
    bb: Bool;
}

contract MixedDefaults {
    payload: Mixed;
    init() {
        self.payload = Mixed{
            bi: 2,
            bb: true
        };
    }
}