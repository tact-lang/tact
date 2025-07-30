struct EmbeddedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Complex {
    part: EmbeddedOptionals;
    flag: Bool;
    count: Int;
}

contract OptionalMix {
    data: Complex;

    init() {
        self.data = Complex{
            part: EmbeddedOptionals{
                a: null,
                b: true,
                c: null
            },
            flag: false,
            count: 99
        };
    }
}