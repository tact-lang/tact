struct MixOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Int;
    e: String;
    f: Bool;
}

contract OptMixTest {
    data: MixOptional;

    init() {
        self.data = MixOptional{
            a: null,
            b: null,
            c: true,
            d: 123,
            e: "abc",
            f: false,
        };
    }
}