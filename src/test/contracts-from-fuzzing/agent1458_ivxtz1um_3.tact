struct StructWithOptional {
    x: Int;
    nickname: String?;
}

contract OptionalField {
    profile: StructWithOptional;

    init() {
        self.profile = StructWithOptional{ x: 5, nickname: null };
    }
}