struct MixOptDef {
    x: Int? = null;
    y: Bool? = false;
    z: String? = "hello";
}

contract Mixed {
    v: MixOptDef;

    init() {
        self.v = MixOptDef{};
    }

    receive() {}
}