struct MixNullDefaults {
    a: Int?;
    b: Bool = true;
    c: String = "def";
}

contract OptionalDefaultMix {
    val: MixNullDefaults;

    init() {
        self.val = MixNullDefaults{ a: null };
    }
}