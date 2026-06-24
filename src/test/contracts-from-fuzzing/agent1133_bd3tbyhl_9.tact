struct OptionalsLayer1 {
    a: Int?;
    b: Bool?;
}

struct OptionalsLayer2 {
    nested: OptionalsLayer1?;
    s: String?;
}

struct OptionalsLayer3 {
    upper: OptionalsLayer2?;
    n: Int;
}

contract OptionalLayers {
    complex: OptionalsLayer3;

    init() {
        self.complex = OptionalsLayer3{
            upper: null,
            n: 123
        };
    }
}