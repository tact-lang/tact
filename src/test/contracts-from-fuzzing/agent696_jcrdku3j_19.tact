struct MixOptDef {
    a: Int? = null;
    b: Bool? = null;
    c: String = "abcd";
}

contract TestContract {
    x: MixOptDef;

    init() {
        self.x = MixOptDef{};
    }
}