struct MixOptionalDefault {
    a: Int = 7;
    b: String?;
    c: Bool = false;
}

contract OptionalAndDefault {
    data: MixOptionalDefault;
    init() {
        self.data = MixOptionalDefault{};
    }
}