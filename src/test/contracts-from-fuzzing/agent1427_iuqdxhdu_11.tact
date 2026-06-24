struct StringMix {
    a: String;
    b: String?;
    c: String;
}

contract StringMixTest {
    data: StringMix;
    init() {
        self.data = StringMix{
            a: "alpha",
            b: null,
            c: "charlie"
        };
    }
}