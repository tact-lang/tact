struct DifferentOpt {
    ai: Int?;
    ab: Bool?;
    astr: String?;
    aaddr: Address?;
}

contract NestedOpts {
    nest: DifferentOpt?;

    init() {
        self.nest = null;
    }
}