struct OptionalField {
    x: Int?;
    b: Bool?;
    s: String?;
}

contract Opts {
    d1: OptionalField;
    
    init() {
        self.d1 = OptionalField{ x: null, b: null, s: null };
    }
}
