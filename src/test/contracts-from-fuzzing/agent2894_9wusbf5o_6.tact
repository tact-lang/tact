struct OptionalsMix {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Address?;
    f: Slice?;
}

contract Test {
    data: OptionalsMix;

    init() {
        self.data = OptionalsMix{
            a:null, b:null, c:null, d:null, e:null, f:null
        };
    }
}