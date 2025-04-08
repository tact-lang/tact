struct ComplexDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "s";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexDefaultContract {
    data: ComplexDefault = ComplexDefault{};
    init() {}
}