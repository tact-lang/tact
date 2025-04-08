struct DeepDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract DefaultNested {
    data: DeepDefaults;

    init() {
        self.data = DeepDefaults{ a: 17, b: true, c: null, d: false };
    }
}