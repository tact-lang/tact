struct MixOptional {
    s: String?;
    b: Bool;
    i: Int?;
}

contract OptMixPersist {
    val: MixOptional;

    init() {
        self.val = MixOptional{ s: null, b: true, i: null };
    }
}