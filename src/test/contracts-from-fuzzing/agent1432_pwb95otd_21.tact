struct AltOpt {
    a: Int?;
    b: Bool;
    c: String?;
    d: Int;
    e: Bool?;
}

contract TestContract {
    alt: AltOpt;

    init() {
        self.alt = AltOpt{
            a: null,
            b: true,
            c: "hello",
            d: 777,
            e: null
        };
    }
}