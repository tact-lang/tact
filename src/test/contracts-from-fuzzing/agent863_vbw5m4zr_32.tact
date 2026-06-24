struct DNested {
    inner: Int = 1;
    optInner: Bool? = null;
    strInner: String = "hi";
}

contract ComplexDefaults {
    s: DNested = DNested{};

    init() {}
}