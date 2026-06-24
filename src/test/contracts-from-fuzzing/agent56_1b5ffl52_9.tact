struct OptionalFlags {
    optA: Bool?;
    optB: Bool?;
    optC: Int?;
}

contract OptionalGroup {
    flags: OptionalFlags;

    init() {
        self.flags = OptionalFlags{
            optA: null,
            optB: true,
            optC: null,
        };
    }
}