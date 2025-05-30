struct DefaultsMix {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
    d: Bool?;
    e: Int = 2;
    f: Bool = true;
}

contract DefaultsMixContract {
    st: DefaultsMix;

    init() {
        self.st = DefaultsMix{
            c: null,
            d: null,
        };
    }
}
