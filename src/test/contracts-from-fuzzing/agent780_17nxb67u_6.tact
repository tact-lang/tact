struct MixOptions {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalMix {
    mixed: MixOptions;

    init() {
        self.mixed = MixOptions{ a: null, b: null, c: null };
    }
}