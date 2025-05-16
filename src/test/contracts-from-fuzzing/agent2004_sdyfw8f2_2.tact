struct Inner {
    intOpt: Int? = null;
    strOpt: String? = null;
    addrOpt: Address? = null;
}

contract OptStructField {
    nested: Inner = Inner{};

    init() {}
}
