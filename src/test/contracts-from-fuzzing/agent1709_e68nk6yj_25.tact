// contract field with optional struct containing optional primitives
struct DeepOptional {
    i: Int?;
    b: Bool?;
    a: Address?;
}

contract ComplexOptionalField {
    data: DeepOptional?;
    init() {
        self.data = null;
    }
}