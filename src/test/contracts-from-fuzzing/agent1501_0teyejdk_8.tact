struct MixOptional {
    a: Int;
    b: Bool?;
    c: String;
    d: Slice?;
}

contract MixedOptionals {
    data: MixOptional;

    init() {
        self.data = MixOptional {
            a: 42,
            b: true,
            c: "hi",
            d: null
        };
    }
}