struct OptFlags {
    f1: Bool?;
    f2: Bool?;
    f3: Bool?;
    f4: Bool?;
    f5: Bool?;
    f6: Bool?;
    f7: Bool?;
    f8: Bool?;
}

contract NullFlags {
    flags: OptFlags;

    init() {
        self.flags = OptFlags{};
    }
}