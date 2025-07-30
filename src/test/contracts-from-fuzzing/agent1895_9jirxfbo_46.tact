struct MixOptInits {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptInits {
    val: MixOptInits;
    init() {
        self.val = MixOptInits {
            a: 42,
            b: null,
            c: null
        };
    }
}