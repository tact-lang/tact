struct Mixed {
    a: String = "";
    b: Int = 0;
    c: Bool = true;
    d: Bool = false;
    e: Int? = null;
    f: String? = null;
}

contract NestedMixed {
    m: Mixed = Mixed{};
    init() {}
}