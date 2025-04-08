struct DeepOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract HasOptionals {
    s: DeepOptional;

    init() {
        self.s = DeepOptional{
            a: null,
            b: true,
            c: null,
        };
    }
}