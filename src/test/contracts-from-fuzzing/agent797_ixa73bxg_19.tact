struct SOpt {
    foo: Int?;  // no = null
    bar: Bool?; // no = null
}

contract TestImplicitOptNulls {
    storage: SOpt = SOpt{};
    init() {}
}