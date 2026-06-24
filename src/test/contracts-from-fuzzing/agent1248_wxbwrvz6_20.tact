struct ManyFlags {
    f1: Bool = false;
    f2: Bool = false;
    f3: Bool = false;
    f4: Bool = false;
    f5: Bool = false;
    f6: Bool = false;
    msg: String;
}

contract FlagCompression {
    flags: ManyFlags;

    init() {
        self.flags = ManyFlags{
            msg: "flags"
        };
    }
}
