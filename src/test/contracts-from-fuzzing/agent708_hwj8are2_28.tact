struct InnerAd {
    a: Int;
    b: String;
}

struct OuterAd {
    x: Int;
    y: Bool;
    z: InnerAd;
}

contract MultitypeNested {
    data: OuterAd;

    init() {
        self.data = OuterAd{
            x: 1,
            y: true,
            z: InnerAd{ a:2, b:"foo" }
        };
    }
}