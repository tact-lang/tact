struct DeepOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOuter {
    d: DeepOptionals?;
}

contract DeepOptionalFields {
    outer: WrapOuter?;

    init() {
        self.outer = WrapOuter{ d: null };
    }
}