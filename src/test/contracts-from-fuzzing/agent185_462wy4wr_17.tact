struct MixOptionalNested {
    val: Int?;
    nested: Nested?;
}

struct Nested {
    text: String;
    flag: Bool?;
}

contract OptionalMix {
    storage: MixOptionalNested;

    init() {
        self.storage = MixOptionalNested{
            val: null,
            nested: Nested{ text: "abc", flag: null }
        };
    }
}