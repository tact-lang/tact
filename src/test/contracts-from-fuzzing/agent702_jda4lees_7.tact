struct MultiOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestMultiOptDefault {
    mopt: MultiOpt = MultiOpt{};
    init() {
        // no explicit assignment
    }
}