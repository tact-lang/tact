struct DefaultAndOption {
    i: Int = 10;
    s: String? = null;
    b: Bool;
}

contract MixedDefaults {
    f: DefaultAndOption;

    init() {
        self.f = DefaultAndOption{ b:true };
    }
}