struct OptionalMix {
    a: Int?;
    b: String?;
    c: Bool;
    d: String;
    e: Bool?;
}

contract TestContract {
    rec: OptionalMix;

    init() {
        self.rec = OptionalMix{
            a: null,
            b: null,
            c: true,
            d: "hi",
            e: false
        };
    }
}