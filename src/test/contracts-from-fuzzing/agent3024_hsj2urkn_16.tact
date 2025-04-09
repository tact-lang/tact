struct Mixture {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: String?;
    e: Bool?;
    f: Int?;
}

contract MixtureContract {
    st: Mixture;

    init() {
        self.st = Mixture{
            a: 5,
            b: 255,
            c: true,
            d: null,
            e: false,
            f: null
        };
    }
}
