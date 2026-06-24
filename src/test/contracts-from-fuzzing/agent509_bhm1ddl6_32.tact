struct Leaf {
    a: Int?;
    b: Bool?;
}

struct Mid {
    leaf: Leaf?;
    str: String?;
}

contract OptionalDeepDefaults {
    data: Mid;

    init() {
        self.data = Mid{
            leaf: null,
            str: null
        };
    }
}