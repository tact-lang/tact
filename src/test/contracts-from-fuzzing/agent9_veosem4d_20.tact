struct OptionalPrimitives {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract OptionalMix {
    data: OptionalPrimitives;
    init() {
        self.data = OptionalPrimitives{
            i:null, b:null, s:null, a:null
        };
    }
}