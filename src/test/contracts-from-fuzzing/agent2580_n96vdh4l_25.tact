struct OptionalChain {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructs {
    x: OptionalChain;

    init() {
        self.x = OptionalChain{
            a: null,
            b: null,
            c: null
        };
    }
}
