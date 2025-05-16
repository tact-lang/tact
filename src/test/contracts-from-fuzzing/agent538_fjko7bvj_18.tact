struct Rec {
    flag: Bool?;
    nested: Nested?;
}

struct Nested {
    val: Int?;
}

contract OptionalMix {
    r: Rec;

    init() {
        self.r = Rec{
            flag: null,
            nested: null
        };
    }
}
