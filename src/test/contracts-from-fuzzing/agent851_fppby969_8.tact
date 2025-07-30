struct BigOptional {
    a: Int?; b: Bool?; c: String?; d: Cell?; e: Slice?; f: Builder?; g: Address?;
}

contract ComplexOptionalFields {
    data: BigOptional;
    init() {
        self.data = BigOptional{
            a: null, b: null, c: null, d: null, e: null, f: null, g: null
        };
    }
}