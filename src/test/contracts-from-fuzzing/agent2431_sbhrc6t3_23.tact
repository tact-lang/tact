struct HasOpts {
    x: Int?;
    y: Bool?;
}

contract NestedSomeOptOmitted {
    s: HasOpts;

    init() {
        self.s = HasOpts{};
    }
}