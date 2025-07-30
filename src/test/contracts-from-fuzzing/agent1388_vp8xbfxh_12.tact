struct Defaults {
    a: Int? = 1;
    b: Int? = 2;
    c: Bool? = true;
    d: Bool? = false;
    e: Address? = null;
    f: String? = "hello";
}

contract Test {
    data: Defaults = Defaults{};
    init() {}
}
