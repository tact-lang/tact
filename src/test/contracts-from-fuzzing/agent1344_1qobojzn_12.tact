struct MixOptionalDefault {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Cell? = null;
}

contract OptionalDefaultTest {
    stuff: MixOptionalDefault;

    init() {
        self.stuff = MixOptionalDefault{};
    }
}
