struct OptionalAndDefault {
    a: Int?;
    b: Int = 5;
    c: String?;
    d: Bool = false;
}

contract MixOptDefaults {
    mix: OptionalAndDefault;

    init() {
        self.mix = OptionalAndDefault{
            a: null,
            c: null
        };
    }
}