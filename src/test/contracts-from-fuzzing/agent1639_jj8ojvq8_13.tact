struct Combination {
    a: Int;
    b: Int?;
    c: String;
    d: Bool?;
    e: Inner;
}

struct Inner {
    x: Int;
    y: String?;
}

contract MixOptInNested {
    dat: Combination;

    init() {
        self.dat = Combination{
            a: 1,
            b: null,
            c: "hi",
            d: true,
            e: Inner{
                x: 77,
                y: null,
            },
        };
    }
}
