struct ManyOpts {
    a: Int? = 1;
    b: String? = null;
    c: Address? = null;
    e: Slice? = null;
    f: Bool? = true;
}

contract TestContract {
    s: ManyOpts = ManyOpts{};
    init() {}
}
