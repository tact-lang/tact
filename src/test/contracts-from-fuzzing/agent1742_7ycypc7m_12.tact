struct HasOptional {
    s: String?;
}

contract OptionalInStructArray {
    f1: HasOptional;
    f2: HasOptional;
    f3: HasOptional;

    init() {
        self.f1 = HasOptional{s: "A"};
        self.f2 = HasOptional{};
        self.f3 = HasOptional{s: "C"};
    }
}