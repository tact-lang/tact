struct InnerOpt {
    foo: Int? = null;
    bar: String? = null;
}

struct MidOpt {
    nested: InnerOpt = InnerOpt{};
    flag: Bool = false;
}

contract OptionalDeepDefaults {
    data: MidOpt = MidOpt{};
}