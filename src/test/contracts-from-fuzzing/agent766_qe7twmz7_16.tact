struct PartOpt {
    x: Int?;
    y: Bool = true;
    z: String?;
}

contract NoAssignNestedOpt {
    inner: PartOpt = PartOpt{};
}