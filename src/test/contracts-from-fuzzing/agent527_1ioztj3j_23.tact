struct BlendedOptional {
    s: String?;
    b: Bool;
    num: Int?;
    flag: Bool?;
}

contract OptionalBlend {
    f: BlendedOptional;
    init() {
        self.f = BlendedOptional{
            s: null,
            b: true,
            num: null,
            flag: null,
        };
    }
}