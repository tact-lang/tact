struct ManyOptions {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
}

contract TestOpt {
    opt_field: ManyOptions = ManyOptions{};
    init() {}
}