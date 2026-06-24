struct PartOpt {
    a: Int;
    b: Int?;
}

contract TestContract {
    s: PartOpt = PartOpt{ a: 1 };
    init() {}
}