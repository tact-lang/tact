struct MixOptional {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
}

contract MixedOptionals {
    data: MixOptional;

    init() {
        self.data = MixOptional{
            a: 1,
            b: null,
            c: true,
            d: null,
        };
    }
}
