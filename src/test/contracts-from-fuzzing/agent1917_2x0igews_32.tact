struct DefaultsMix {
    a: Int = 7;
    b: Bool = false;
}

contract MixOptDefaults {
    val: DefaultsMix?;

    init() {
        self.val = null;
    }
}