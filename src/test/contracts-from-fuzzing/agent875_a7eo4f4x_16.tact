struct DefaultOptMix {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultOptMixTest {
    x: DefaultOptMix;

    init() {
        self.x = DefaultOptMix{
            d: null,
            e: true,
            f: "abc"
        };
    }
}