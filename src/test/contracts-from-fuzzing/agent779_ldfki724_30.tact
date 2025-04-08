struct Messy {
    a: Bool?;
    b: Int;
    c: Bool;
    d: Int?;
    e: Bool;
    f: Int?;
}
contract MixedTogether {
    state: Messy;
    init() {
        self.state = Messy{
            a: null,
            b: 1,
            c: false,
            d: null,
            e: true,
            f: 99
        };
    }
}