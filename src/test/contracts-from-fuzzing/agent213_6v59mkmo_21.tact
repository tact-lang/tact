struct OptionalPrims {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
    c: Cell?;
}

contract X {
    state: OptionalPrims;

    init() {
        self.state = OptionalPrims{
            i:null, b:null, s:null, a:null, c:null
        };
    }
}