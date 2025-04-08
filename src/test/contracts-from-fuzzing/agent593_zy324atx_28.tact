// Struct with defaulted optional fields
struct DefaultedOpts {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract HasDefaults {
    s: DefaultedOpts = DefaultedOpts{};
    init() {}
}