struct Flags {
    opt1: Bool?;
    opt2: Bool?;
    opt3: Bool?;
}

contract OptionalFlags {
    flags: Flags;

    init() {
        self.flags = Flags{ opt1: true, opt2: null, opt3: false };
    }
}