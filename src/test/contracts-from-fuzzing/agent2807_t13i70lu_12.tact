struct OptionMix {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptMulti {
    val: OptionMix;
    init() {
        self.val = OptionMix{ a: null, b: true, c: null };
    }
}