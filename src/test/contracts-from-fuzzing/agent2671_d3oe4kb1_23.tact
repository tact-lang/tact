struct MixDefault {
    a: Int = 1;
    b: Bool?;
    c: String = "abc";
    d: Bool = false;
    e: Int?;
}

contract MixedDefaultsOpt {
    data: MixDefault;

    init() {
        self.data = MixDefault{};
    }
}