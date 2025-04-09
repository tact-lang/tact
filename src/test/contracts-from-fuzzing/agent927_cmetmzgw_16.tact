struct DefaultsMix {
    v1: Int = 7;
    v2: Bool;
    v3: String = "hi";
    v4: Int? = null;
    v5: Bool? = null;
}

contract MixDefaults {
    d: DefaultsMix;

    init() {
        self.d = DefaultsMix{
            v2: true
        };
    }
}