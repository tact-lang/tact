struct MixOpt {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract MixedOptionals {
    val: MixOpt;

    init() {
        self.val = MixOpt{ a: 1, b: true, s: null };
    }
}