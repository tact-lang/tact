struct InnerMost {
    val: Int? as uint7 = null;
}

struct Middle {
    im: InnerMost? = null;
}

contract EdgeCaseFinal {
    nested: Middle = Middle{};

    init() {}
}