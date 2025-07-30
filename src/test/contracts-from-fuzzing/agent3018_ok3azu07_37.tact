struct MixDefaultOptional {
    a: Int?;
    b: Bool? = true;
    c: String? = null;
}

contract OptionalMixed {
    val: MixDefaultOptional = MixDefaultOptional{
        a: null,
    };
}
